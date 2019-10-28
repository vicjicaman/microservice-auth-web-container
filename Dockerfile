FROM node:12.13.0-alpine

ENV LOG_ROOT=/var/log/app
RUN mkdir -p ${LOG_ROOT}
RUN chown -R node ${LOG_ROOT}

ENV APP_ROOT=/env/app
ENV APP_HOME=${APP_ROOT}/node_modules/@nebulario/microservice-auth-web

RUN mkdir -p ${APP_HOME}
RUN chown -R node ${APP_HOME}

USER node

ARG CACHEBUST=1
RUN echo "CACHE $CACHEBUST"

COPY --chown=node:node ./node_modules /env/app/node_modules

WORKDIR ${APP_HOME}
ENTRYPOINT ["node"]
CMD ["dist/index.js"]
