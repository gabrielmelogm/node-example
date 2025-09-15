FROM oven/bun:1 AS builder

WORKDIR /app

COPY package.json package.json
COPY bun.lock bun.lock

COPY src src

RUN bun install

ENV NODE_ENV=production

RUN bun build \
  --compile \
  --minify-whitespace \
  --minify-syntax \
  --outfile server \
  src/index.ts

FROM gcr.io/distroless/base

WORKDIR /app

COPY --from=builder /app/server server

ENV NODE_ENV=production

CMD ["./server"]

EXPOSE 3000
