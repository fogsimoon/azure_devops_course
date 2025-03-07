FROM node:18 AS builder

WORKDIR /build

COPY package*.json ./
RUN npm install

COPY src/ src/
COPY public/ public/
RUN npm run build

FROM node:alpine AS runner

WORKDIR /app
RUN apk add --no-cache iputils

COPY --from=builder build/package*.json .
COPY --from=builder /build/build ./build/
COPY --from=builder /build/node_modules ./node_modules/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV PORT=8080
EXPOSE 8080

CMD ["/entrypoint.sh"]