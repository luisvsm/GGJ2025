import needle from 'needle';

let discordWebhook = "ChangeToUseSecretManagerToStoreSecret";

export class Discord {

    constructor() {}

    public async Post(inputMessage:string):Promise<void>{
        var payload = {
            content: inputMessage.toString().replace(/\*/g, '**')
        };
        if (discordWebhook != "ChangeToUseSecretManagerToStoreSecret"){
            needle.post("https://discord.com/api/webhooks/" + discordWebhook, payload, function(err, resp) {
                if(err)
                    console.log("Error posting to Discord: ", err);
            });
        }
    };

}

