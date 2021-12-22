FROM node:16-alpine as builder

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/echukwukaemeke/node/app

COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /home/echukwukaemeke/node/app/build /usr/share/nginx/html