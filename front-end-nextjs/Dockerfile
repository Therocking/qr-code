FROM node:18-alpine AS build
EXPOSE 3000

WORKDIR /app

COPY ./front-end-nextjs/package.json ./front-end-nextjs/package-lock.json .
RUN npm ci

COPY front-end-nextjs/ .
RUN npm run build

CMD ["npm", "start"]
