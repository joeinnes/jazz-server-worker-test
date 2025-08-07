import { startWorker } from "jazz-tools/worker";

const w = await startWorker({
  accountID: process.env.JAZZ_WORKER_ACCOUNT,
  accountSecret: process.env.JAZZ_WORKER_SECRET,
  syncServer: `wss://cloud.jazz.tools/?${process.env.JAZZ_CLOUD_API_KEY}`,
});
const done = w.done;

console.log("done");
