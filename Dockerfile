FROM node:14

RUN apt-get update && apt-get install -y libusb-1.0-0 libusb-1.0-0-dev libudev-dev

WORKDIR /app

COPY package.json ./

COPY yarn.lock ./

COPY  src/logic/contracts/artifacts ./src/logic/contracts/artifacts

RUN yarn install

COPY . .

EXPOSE 3000
EXPOSE 80/tcp
EXPOSE 80/udp



CMD ["yarn", "start"]
