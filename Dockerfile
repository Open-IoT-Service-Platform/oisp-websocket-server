FROM node:14-alpine

RUN apk add --no-cache ncurses make bash python g++

ADD ./package.json /app/package.json
WORKDIR /app
RUN npm install

# Remove build time dependencies
RUN apk del python g++

ADD . /app
RUN node_modules/grunt-cli/bin/grunt validate

EXPOSE 5000
