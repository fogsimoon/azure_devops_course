FROM node:18 AS builder

WORKDIR /build

COPY package*.json webpack.config.js ./
RUN npm install

COPY src/ src/
RUN npm run build


FROM node:alpine AS runner

WORKDIR /app
RUN apk add --no-cache iputils

COPY --from=builder build/package*.json .
COPY --from=builder build/dist .

RUN npm install
RUN mkdir -p logs

EXPOSE 3000
CMD ["npm", "start"]
