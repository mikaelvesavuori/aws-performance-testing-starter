# Setup steps inside the EC2 instance
# See: https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts

npm install fastify

echo 'const fastify = require("fastify")({ logger: true });

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

start();' >server.js

node server.js
