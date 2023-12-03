FROM node:20-alpine
WORKDIR /server
COPY ./server .
RUN npm install --only=production
EXPOSE 80
CMD node index.js
