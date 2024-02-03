FROM deanxv/coze-discord-proxy:latest
# 创建目录并设置权限
RUN mkdir -p /app/coze-discord-proxy/data/config && chmod 777 /app/coze-discord-proxy/data/config
# 设置工作目录
WORKDIR /app/coze-discord-proxy/data
# 对外暴露的端口
EXPOSE 7077
# 使用RUN命令查看$CONFIG的值，进行调试
RUN echo "Before writing to JSON: $BOT_CONFIG"
# 使用ENV命令设置环境变量，并将其写入JSON文件
RUN echo "$BOT_CONFIG" | sed 's/\\//g' > /app/coze-discord-proxy/data/config/bot_config.json

# 再次使用RUN命令查看bot_config.json的内容，进行调试
RUN cat /app/coze-discord-proxy/data/config/bot_config.json
# 容器启动时运行coze-discord-proxy
ENTRYPOINT ["/coze-discord-proxy"]
