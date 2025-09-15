import { Elysia } from "elysia";
import os from "node:os";

const app = new Elysia();

app.get("/api/v1/details", () => {
  return {
    time: new Date().toLocaleDateString(),
    hostname: os.hostname(),
  };
});

app.get("/api/v1/healthz", () => {
  return {
    status: "ok",
  };
});

app.listen(3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`,
);
