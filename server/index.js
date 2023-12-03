const fastify = require("fastify")({ logger: true });

const PORT = process.env.PORT || 8080;

fastify.get("/", function handler(request, reply) {
  reply.send("Hello World!");
});

const start = async () => {
  try {
    await fastify.listen(PORT, "0.0.0.0"); // We are going to add the last localhost section to make sure this is correctly exposed
    fastify.log.info(`server listening on ${fastify.server.address().port}`);
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();