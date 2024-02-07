From ghcr.io/gordonchanfz/discord-proxy:latest

RUN mkdir -p /app/discord-proxy/data/config && chmod 777 /app/discord-proxy/data/config
RUN printf '%s' "$BOT_CONFIG" | sed 's/\\/"/g' > /app/discord-proxy/data/config/bot_config.json

WORKDIR /app/discord-proxy/data
EXPOSE 7077

ENTRYPOINT ["/discord-proxy"]
