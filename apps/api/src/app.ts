import Fastify, { type FastifyInstance } from "fastify";
import { config } from "./config.js";

export function buildApp(): FastifyInstance {
  const app = Fastify({
    logger: {
      level: config.LOG_LEVEL,
    },
  });

  // Liveness only: the process is up and able to answer HTTP.
  // Dependency checks (/health/ready) arrive on Day 20.
  app.get("/health", async () => ({ status: "ok" }));

  return app;
}
