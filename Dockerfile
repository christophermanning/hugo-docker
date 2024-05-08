FROM alpine:3.19

# install hugo
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

# install npm and dependencies
RUN apk add --no-cache npm

# install node packages globally so they're not saved in the shared docker volume
ENV NODE_PATH=/usr/local/lib/node_modules

# tailwindcss dependencies
RUN npm install -g tailwindcss postcss autoprefixer postcss-cli

WORKDIR /src

EXPOSE 8080
