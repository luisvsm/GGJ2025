import needle from 'needle';

let discordWebhook = "ChangeToUseSecretManagerToStoreSecret";

export class Discord {

    constructor() {}

    public async Post(inputMessage:string):Promise<void>{
        var payload = {
            content: inputMessage.toString().replace(/\*/g, '**')
        };
        console.log("Posting to discord: " + inputMessage);
        if (discordWebhook != "ChangeToUseSecretManagerToStoreSecret"){
            console.log("https://discord.com/api/webhooks/" + discordWebhook);
            needle.post("https://discord.com/api/webhooks/" + discordWebhook, payload, function(err, resp) {
                console.log(err)
            });
        }
    };

}

