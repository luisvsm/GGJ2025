import needle from 'needle';

let discordWebhook = process.env.DISCORD_WEBHOOK || null;

export class Discord {

    constructor() {}

    public async Post(inputMessage:string):Promise<void>{
        var payload = {
            content: inputMessage.toString().replace(/\*/g, '**')
        };
        console.log("Posting to discord: " + inputMessage);
        if (discordWebhook != null){
            const resp = await needle.post("https://discord.com/api/webhooks/" + discordWebhook, payload);
        }
    };

}

