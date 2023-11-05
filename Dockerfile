FROM node:21.0.0

WORKDIR /usr/scr/app

COPY ["package.json","package-lock.json","./"]

RUN npm install 

RUN npm install -g db-migrate

COPY . .

CMD ["node", "index.js"]