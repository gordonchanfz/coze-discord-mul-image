## 前言
为了方便快速体验[coze-discord-proxy](https://github.com/deanxv/coze-discord-proxy),项目作者已经提供了两种一键部署方式：

<details>
<summary><strong>部署到 Zeabur</strong></summary>
<div>

> Zeabur 的服务器在国外，自动解决了网络的问题，同时免费的额度也足够个人使用

点击一键部署:

[![Deploy on Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates/GMU8C8?referralCode=deanxv)

**一键部署后 `BOT_TOKEN`,`GUILD_ID`,`COZE_BOT_ID`,`PROXY_SECRET`,`CHANNEL_ID`变量也需要替换！**

或手动部署:

1. 首先 **fork** 一份代码。
2. 进入 [Zeabur](https://zeabur.com?referralCode=deanxv)，使用github登录，进入控制台。
3. 在 Service -> Add Service，选择 Git（第一次使用需要先授权），选择你 fork 的仓库。
4. Deploy 会自动开始，先取消。
5. 添加环境变量

   `BOT_TOKEN:MTE5OTk2xxxxxxxxxxxxxxrwUrUWNbG63w`  主动发送消息的Bot-Token

   `GUILD_ID:119xxxxxxxx796`  两个机器人所在的服务器ID

   `COZE_BOT_ID:119xxxxxxxx7` 由coze托管的机器人ID

   `CHANNEL_ID:119xxxxxx24`  # 默认频道-在使用与openai对齐的接口时(/v1/chat/completions) 消息会默认发送到此频道

   `PROXY_SECRET:123456` [可选]接口密钥-修改此行为请求头校验的值(多个请以,分隔)，配置此参数后，每次发起请求时请求头加上`proxy-secret`
   参数，即`header`中添加 `proxy-secret：123456`

保存。

6. 选择 Redeploy。

</div>


</details>

<details>
<summary><strong>部署到 Render</strong></summary>
<div>

> Render 提供免费额度，绑卡后可以进一步提升额度

Render 可以直接部署 docker 镜像，不需要 fork 仓库：[Render](https://dashboard.render.com)

</div>
</details>

由于作者当前提供的Zeabur版本，还未支持多频道，这里补充多频道的Zeabur版本，以支持会话隔离。

（不用绑卡，也可以临时体验免费套餐）
![image](https://github.com/gordonchanfz/coze-discord-mul-image/assets/77518307/20718f61-6c0c-498f-8196-da3cd37da29b)

## 多频道部署(会话隔离)

点击一键部署:

[![Deploy on Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates/KXBV2H?referralCode=gordonchanfz)

**一键部署后 `BOT_TOKEN`,`GUILD_ID`,`COZE_BOT_ID`,`PROXY_SECRET`,`CHANNEL_ID`,`BOT_CONFIG`变量也需要替换！**

或手动部署:

1. 首先 **fork** 一份代码。
2. 进入 [Zeabur](https://zeabur.com?referralCode=deanxv)，使用github登录，进入控制台。
3. 在 Service -> Add Service，选择 Git（第一次使用需要先授权），选择你 fork 的仓库。
4. Deploy 会自动开始，先取消。
5. 添加环境变量

   `BOT_TOKEN:MTE5OTk2xxxxxxxxxxxxxxrwUrUWNbG63w`  主动发送消息的Bot-Token

   `GUILD_ID:119xxxxxxxx796`  两个机器人所在的服务器ID

   `COZE_BOT_ID:119xxxxxxxx7` 由coze托管的机器人ID

   `CHANNEL_ID:119xxxxxx24`  # 默认频道-在使用与openai对齐的接口时(/v1/chat/completions) 消息会默认发送到此频道

   `PROXY_SECRET:123456` [可选]接口密钥-修改此行为请求头校验的值(多个请以,分隔)，配置此参数后，每次发起请求时请求头加上`proxy-secret`
   参数，即`header`中添加 `proxy-secret：123456`

   `BOT_CONFIG`:
   ``` 
   [
     {
      "proxySecret": "123",
      "cozeBotId": "12***************31", 
      "channelId": "12***************56"
     },{
      "proxySecret": "456",
      "cozeBotId": "12***************64",
      "channelId": "12***************78"
     },{
      "proxySecret": "789",
      "cozeBotId": "12***************12",
      "channelId": "12***************24"
     }
   ]
   ```


![image](https://github.com/gordonchanfz/coze-discord-mul-image/assets/77518307/8780f717-0b68-4df6-9532-37d5f4d51b6b)


6. Redeploy。
7. 在Networking中public生成一个域名，然后可以与漂亮国沟通了。

![image](https://github.com/gordonchanfz/coze-discord-mul-image/assets/77518307/24325e3f-a835-4ae3-a857-dc14e29339a2)

8. 部署好，可以先自测，下面接口测试命令：
   ```shell
   curl -X 'POST' \
   'https://your.zeabur.app/api/chat' \
   -H 'accept: application/json' \
   -H 'proxy-secret: your key' \
   -H 'Content-Type: application/json' \
   -d '{
   "channelId": "your channelId",
   "content": "画一只猪",
   "stream": true
   }'
   ```

   ```shell
   curl -X 'POST' \
    'https://your.zeabur.app/v1/chat/completions' \
    -H 'accept: application/json' \
    -H 'Authorization: your key' \
    -H 'Content-Type: application/json' \
    -d '{
    "channelId": "your channelId",
    "messages": [
      {
        "content": "鲁迅和周树人是两个人？",
        "role": "user"
      }
    ],
   "stream": true
   }'
   ```
![image](https://github.com/gordonchanfz/coze-discord-mul-image/assets/77518307/e1a4aea3-0834-4d40-a612-8ca41fd3a68b)

最后要说的是，本篇没什么技术含量，主要是baipiao作者项目，做点贡献，觉得不错就帮原作者推广；


