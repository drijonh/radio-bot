FROM oven/bun:alpine AS dependencies
WORKDIR /app

COPY package.json bun.lock ./

RUN bun install --frozen-lockfile --production --ignore-scripts


FROM oven/bun:alpine AS runner
WORKDIR /app

COPY package.json ./
COPY src/ ./src/
COPY --from=dependencies /app/node_modules ./node_modules

CMD ["bun", "run", "src/index.ts"]