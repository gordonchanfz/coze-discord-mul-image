From deanxv/coze-discord-proxy:latest

RUN mkdir -p /app/coze-discord-proxy/data/config && chmod 777 /app/coze-discord-proxy/data/config

# 获取config.json
RUN --mount=type=secret,id=CONFIG,mode=0444,required=true \
    cat /run/secrets/CONFIG > /app/coze-discord-proxy/data/config/bot_config.json && chmod 777 /app/coze-discord-proxy/data/config/bot_config.json

WORKDIR /app/coze-discord-proxy/data

ENTRYPOINT ["/coze-discord-proxy"]
