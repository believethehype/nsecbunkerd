FROM --platform=linux/amd64 node:slim as build
WORKDIR /app

COPY package.json .
RUN npm i

COPY . .
RUN npm run build

RUN npx prisma generate
ENTRYPOINT [ "node", "dist/index.js" ]
CMD ["start"]
