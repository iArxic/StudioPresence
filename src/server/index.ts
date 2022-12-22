import drpc from "discord-rpc";
import chalk from "chalk";
import http from "http";

const SERVER_PORT = 4455;
const CLIENT_ID = "1028311936854675458";

async function login(drpcClient: drpc.Client) {
  let user: drpc.User | undefined;

  try {
    user = (
      await drpcClient.login({
        clientId: CLIENT_ID,
      })
    ).user;
  } finally {
    if (!user) {
      console.log(chalk.red("DRPC failed to start (Is Discord open?)"));

      process.exit(1);
    } else {
      console.log(chalk.green("DRPC started"));
    }
  }
}

async function main() {
  const drpcClient = new drpc.Client({ transport: "ipc" });

  login(drpcClient);

  http
    .createServer((req, res) => {
      let data: any = "";

      req.on("data", (additionalData) => {
        data += additionalData;
      });

      req.on("end", () => {
        try {
          data = JSON.parse(data).activity;
          drpcClient.setActivity({
            details: data.details,
            startTimestamp: data.timestamps.start,
            state: data.state,
            largeImageText: data.assets.large_text,
            largeImageKey: data.assets.large_image,
            smallImageText: data.assets.small_text,
            smallImageKey: data.assets.small_image
          });

          if (data.updateType === "CLOSE") {
            drpcClient.Destroy()
          }
 
          res.writeHead(200, { "Content-Type": "text/plain" });
          res.end("SET Activity");
        } catch (err: any) {
          try {
            console.log(err.message)
          } catch (err: any) {
            console.log("Failed to clear activity: " + err.message);
          }
        }
      });
    })
    .listen(SERVER_PORT);
}

main();