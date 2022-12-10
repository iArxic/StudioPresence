let drpc = require('discord-rpc');
let RPC = new drpc.Client({ transport: 'ipc' });
(async() => {
    
    let chalk = require('chalk');
    let http = require('http');
    let lastStudioEdit = Date.now();
    http.createServer((req, res) => {
        let data = "";
        req.on('data', (dt) => {
            data += dt;
        });
        req.on('end', () => {
            lastStudioEdit = Date.now();
            try {
                data = JSON.parse(data);

                if (data.updateType == "CLOSE") {
                    RPC.request('SET_ACTIVITY', {
                        pid: process.pid,
                    });
                    
                    RPC.transport.close();
                    RPC.transport.connect();
                } else {
                    RPC.request('SET_ACTIVITY', {
                        pid: process.pid,
                        activity: data.activity
                    });
                };

                res.writeHead(200, {'Content-Type': 'text/plain'});
                res.end('SET Activity');
            } catch (err) {console.log(`${err.message} Restart Discord, if the issue persists wait some time.`)};
        });
    }).listen(4455);
    RPC.login({ clientId: "1028311936854675458" }).then(() => {
        console.log(`Started!`);
    }).catch((err) => {
        console.log(chalk.red(`${err.message} Restart Discord, if the issue persists wait some time.`));
    });
})();