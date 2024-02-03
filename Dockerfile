From deanxv/coze-discord-proxy:latest

RUN mkdir -p /app/coze-discord-proxy/data/config && chmod 777 /app/coze-discord-proxy/data/config

# 设置环境变量，并将其写入JSON文件
CMD ["sh", "-c", "echo '{\"bot_config\":\"${BOT_CONFIG}\"}' > /app/coze-discord-proxy/data/config/bot_config.json"]

WORKDIR /app/coze-discord-proxy/data

EXPOSE 7077

ENTRYPOINT ["/coze-discord-proxy"]
