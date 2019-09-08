FROM node:8.13.0-alpine

RUN mkdir -p /app
RUN chown -R node /app

USER node

ARG CACHEBUST=1
COPY ./node_modules /app/node_modules

WORKDIR /app/node_modules/@nebulario/microservices-auth-web

ENTRYPOINT ["node"]
CMD ["dist/index.js"]
