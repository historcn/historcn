# 项目初衷

青史，一个历史性人物和事件的镌刻之地。

不如百科全面，亦无百科冗长；

寥寥数百字，青史留世间。

知来日方长，愿事事皆好。

本站由李文亮医生去世引发思考，进而动手搭建。


# 涉及内容

青史，有名垂青史，也有遗臭万年。什么样的事件和人物值能在中华民族的历史长河中激起浪花，就应该永刻青史。  

不谈政治等敏感内容。


# 入史要求

- 事件或人物受到全民关注、讨论反思
- 事件或人物必须客观事实、用语中立
- 事件或人物促进制度变革、社会进步
- 伟大的事件或人物

# 贡献说明

本项目使用 [hugo](https://github.com/gohugoio/hugo) 生成，静态页面托管于 [historcn.github.io](https://github.com/historcn/historcn.github.io)

克隆本项目，在 `content/cn` 以 markdown 格式书写内容即可。

- 本地运行
```bash
git clone https://github.com/historcn/historcn
cd historcn
git submodule update --init --recursive
hugo serve -w --baseURL http://$(hostname -i) --bind $(hostname -i)
```

- 推送代码
```bash
echo -e 'y\n' | ssh-keygen -f ~/.ssh/id_historcn -N ''
# 将ssh-key 添加到 github
cat /root/.ssh/id_historcn.pub

bash deploy.sh any commit message
```

你也可以将 `deploy.sh` 里面的 `id_historcn` 改为 `id_rsa`，使用默认的ssh-key 推送。


# 版权说明

我们只保留版权，其它请随意使用。
本项目遵循 [MIT 许可](https://en.wikipedia.org/wiki/MIT_License)。

