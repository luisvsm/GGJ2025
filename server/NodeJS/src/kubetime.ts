import { KubeConfig, CoreV1Api, V1Container, V1Pod, V1PodSpec, V1ObjectMeta, V1EnvVar, V1ContainerPort } from '@kubernetes/client-node';

import { randomUUID } from 'crypto';
import needle from 'needle';
import { Discord } from './discord';

let discord = new Discord();
const namespace = process.env.KUBE_NAMESPACE || "ggj25-null-namespace"

export interface GameServerPodInfo{
	port: number
	name: string
}

export class KubeTime {
    public k8sApi: CoreV1Api;
    private localClusterIP = "10.0.0.3"
    private startingWebServicePort = 50
    private maxServers = 10;

    constructor() {
        let kc = new KubeConfig();
        kc.loadFromDefault();
        
        this.k8sApi = kc.makeApiClient(CoreV1Api);
    }

    private timeout(ms:number) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    public async CreatePod(clientVersion:string, gameMode:number):Promise<GameServerPodInfo | null>{
        try {
            
            const items = await this.RequestPods();
            if(items == null){
                console.error("Error requesting pods.");
                return null;
            }
            
            let serverNumbersInUse:{[id:number]:boolean} = {};

            for (let i = 0; i < items.length; i++) {
                let item = items[i];

                if(item.metadata == undefined || item.metadata.labels == undefined){
                    break;   
                }
                
                let serviceNumber:string|null = item.metadata.labels[namespace + ".service"];
                if(serviceNumber == null){
                    break;
                }

                serverNumbersInUse[Number(serviceNumber)] = true;
            }
            
            let nextServerNumber = -1;
            for (let i = 1; i <= this.maxServers; i++) {
                if(serverNumbersInUse[i] == undefined){
                    nextServerNumber = i;
                    break;
                }
            }

            if(nextServerNumber > this.maxServers || nextServerNumber == -1){
                console.error("Hit server capacity!!!");
                return null;
            }
            
            let container = new V1Container();
            container.name = namespace + "-gameserver-" + randomUUID();
            container.image = "10.0.0.3:5000/ggj25/" + namespace +"-gameserver:" + clientVersion;
            container.env = []
            let envVar = new V1EnvVar()
            envVar.name = "server"
            envVar.value = "true"
            container.env.push(envVar)

            container.ports = []
            let gameServUDP = new V1ContainerPort()
            gameServUDP.protocol = "UDP"
            gameServUDP.containerPort = 7000
            let gameServTCP = new V1ContainerPort()
            gameServTCP.protocol = "TCP"
            gameServTCP.containerPort = 7000
            let webServTCP = new V1ContainerPort()
            webServTCP.protocol = "TCP"
            webServTCP.containerPort = 8080

            container.ports.push(gameServUDP)
            container.ports.push(gameServTCP)
            container.ports.push(webServTCP)

            let gameServerPod = new V1Pod();
            gameServerPod.apiVersion = "v1";
            gameServerPod.spec = new V1PodSpec();
            gameServerPod.spec.containers = [];
            gameServerPod.spec.containers.push(container);
            gameServerPod.metadata = new V1ObjectMeta();
            gameServerPod.metadata.name = container.name;
            gameServerPod.metadata.labels = {};
            gameServerPod.metadata.labels[namespace + ".service"] = nextServerNumber.toString();
            gameServerPod.metadata.labels[namespace + ".gameMode"] = gameMode.toString();

            const gameServerRequest = await this.k8sApi.createNamespacedPod({namespace, body:gameServerPod});
            discord.Post("Creating pod: "+ container.name);
            console.log("Created pod: " + container.name);
            return {
                name:container.name,
                port: Number("270" + (this.startingWebServicePort + nextServerNumber-1))
            }
            
        } catch (err) {
            console.error("Caught exception: ", err);
            return null;
        }
    }

    public async GetPodPort(podName:string):Promise<number>{
        try {
            const podsRes = await this.k8sApi.readNamespacedPod({namespace, name:podName});

            if(podsRes.status == undefined || podsRes.status.conditions == undefined){
                console.log("Status or condition was not defined");
                return -1;
            }

            let readyConditionFound = false;
            for (let i = 0; i < podsRes.status.conditions.length; i++) {
                const condition = podsRes.status.conditions[i];

                if(condition.type == "Ready"){
                    readyConditionFound = true;

                    if(condition.status != "True"){
                        // console.log("Waiting for pod to be ready, status: " + condition.status );
                        return -1;
                    }else{
                        // console.log("Pod is ready");
                    }
                }
            }
            
            if(readyConditionFound == false){
                console.log("Ready condition was not found");
                return -1;
            }

            if(podsRes.metadata == undefined || podsRes.metadata.labels == undefined){
                console.error("Pod metadata or label was empty even though the pod was ready");
                return -1;
            }
            
            // Pod is ready, now wait for the game server
            let serviceNumber = podsRes.metadata.labels[namespace+".service"];
            if(serviceNumber == null){
                console.error("serviceNumber was null even though the pod was ready");
                return -1;
            }
            
            return Number(serviceNumber);
        }catch(err){
            console.error(err);
            return -1;
        }
    }

    public async WaitForPodToBeReady(podName:string, gameMode:number | null = null):Promise<boolean>{
        const timeoutDurationInSeconds = 20;

        let timeout = Date.now() + (timeoutDurationInSeconds * 1000);
        let ready = false;

        console.log("Waiting for pod: " + podName);
        let serviceNumber = -1;

        while(ready == false && timeout > Date.now()){
            await this.timeout(300);

            if(serviceNumber == -1){
                serviceNumber = await this.GetPodPort(podName);
            }else{
                try {
                    console.log("Req: http://" + this.localClusterIP + ":302" + (this.startingWebServicePort + serviceNumber-1) + "/info")
                    const resp = await needle('get', "http://" + this.localClusterIP + ":302" + (this.startingWebServicePort + serviceNumber-1) + "/info", {parse_response:false});
                    JSON.parse(resp.body);
                    console.log("Pod "+podName+" ready after " + (timeoutDurationInSeconds - ((timeout - Date.now())/1000)).toString() + " seconds.");
                    if(gameMode != undefined){
                        const gameModeResp = await needle('get', "http://" + this.localClusterIP + ":302" + (this.startingWebServicePort + serviceNumber-1) + "/mode/" + parseInt(gameMode.toString()), {parse_response:false});
                    }

                    return true;
                } catch (e) {
                    console.log("Game server is not ready", e);
                }
            }

            // console.log((timeout - Date.now())/1000 + "seconds left on timeout");
        }

        
        console.log("Server timed out! " + timeout + " > " + Date.now());
        console.log("ready: " + ready + "\ntimeout > Date.now(): " + (timeout > Date.now()));

        return false;
    }

    public async RequestPods(): Promise<V1Pod[] | null>{
        try {
            const podsRes = await this.k8sApi.listNamespacedPod({namespace});
            return podsRes.items;
        } catch (err) {
            console.error(err);
            return null;
        }
        
    };

    public async GetPodsRunningGameMode(gameModeToFind:number): Promise<GameServerPodInfo | null>{
        try {
            const items = await this.RequestPods();
            if(items == null){
                return null;
            }

            for (let i = 0; i < items.length; i++) {
                let item = items[i];

                if(item.metadata == undefined || item.metadata.labels == undefined){
                    break;   
                }
                
                let gameMode = item.metadata.labels[namespace+".gameMode"];
                let serviceNumber = item.metadata.labels[namespace+".service"];
                if(serviceNumber == null){
                    break;
                }
                if(gameMode == null){
                    break;
                }
                if(item.metadata.name == null){
                    break;
                }
                if(item.status == null || item.status.conditions == null){
                    break;
                }
                //if(this.podsBeingTerminated[item.metadata.name]){
                 //   break;
                //}

                let success = await this.WaitForPodToBeReady(item.metadata.name);
                
                if(gameModeToFind.toString() == gameMode){
                    return {
                        name: item.metadata.name,
                        port: Number("270" + (this.startingWebServicePort + parseInt(serviceNumber)-1))
                    }
                }
            }
        } catch (err) {
            console.error("Error in LookForServersToTerminate", err);
        }

        return null;
    }

    public async LookForServersToTerminate(){
        try {
            const items = await this.RequestPods();
            if(items == null){
                return
            }

            for (let i = 0; i < items.length; i++) {
                let item = items[i];
                
                if(item.metadata == undefined || item.metadata.labels == undefined){
                    break;   
                }
                
                let serviceNumber:string|null = item.metadata.labels[namespace+".service"];
                if(serviceNumber == null){
                    break;
                }
                if(item.metadata.name == undefined){
                    break;
                }
                //if(this.podsBeingTerminated[item.metadata.name] == true){
                //    break;
                //}
                if(item == undefined || item.status == undefined || item.status.containerStatuses == undefined){
                    break;
                }

                item.status.containerStatuses.forEach(status => {
                    console.log("condition", status);
                });
                
                const resp = await needle('get', "http://" + this.localClusterIP + ":302" + (this.startingWebServicePort + parseInt(serviceNumber)-1) + "/info");
                const respJSON = JSON.parse(resp.body)
                if(
                    (respJSON.gameHasStarted == true && parseInt(respJSON.playersConnected) <= 0) ||
                    (respJSON.gameHasStarted == false && parseInt(respJSON.uptime) > 30) ||
                    respJSON.requestedTermination == true ||
                    parseInt(respJSON.uptime) > 60 * 60 * 8 // More than 8 hours of uptime 
                ){
                    discord.Post("Terminating pod: " + item.metadata.name);
                    console.log("Terminating " + item.metadata.name);
                    console.log("Server details:", resp.body);
                    await this.k8sApi.deleteNamespacedPod({namespace, name:item.metadata.name});
                }
            }
        } catch (err) {
            console.error("Error in LookForServersToTerminate", err);
        }
    }
    
    public async ReadPods(): Promise<void>{
        try {
            const items = await this.RequestPods();
            if(items == null){
                return
            }

            for (let i = 0; i < items.length; i++) {
                let item = items[i];

                if(item.metadata == undefined || item.metadata.labels == undefined){
                    break;   
                }
                
                let serviceNumber:string|null = item.metadata.labels[namespace+".service"];
                if(serviceNumber == null){
                    break;
                }

                const resp = await needle('get', "http://" + this.localClusterIP + ":302" + (this.startingWebServicePort + parseInt(serviceNumber)-1) + "/info");
                console.log(serviceNumber + ":", JSON.stringify(resp.body));
            }
        } catch (err) {
            console.error(err);
        }
         
    };
}

