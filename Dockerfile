FROM node:10 AS react-build
RUN mkdir app
COPY ./ /app
WORKDIR /app
ARG OPENIMIS_CONF_JSON
ENV OPENIMIS_CONF_JSON=${OPENIMIS_CONF_JSON}
RUN node openimis-config.js
#RUN . ./modules-adds.txt
RUN . ./modules-installs.txt
RUN npm install --network-timeout 1000000
RUN npm run build
RUN yarn global add serve
CMD ["serve","-s","build"]
