# [am-serv00-vmess](https://github.com/ansoncloud8/am-serv00-vmess/)

# 一键安装
```
bash <(curl -Ls https://raw.githubusercontent.com/ansoncloud8/am-serv00-vmess/main/install_serv00_vmess.sh)
```

- 查看保活crontab任务
```
crontab -l
```
- 上面命令完会显示下面信息就是有保活设置成功
```
*/12 * * * * pgrep -x "web" > /dev/null || nohup /home/${USER}/.vmess/web run -c config.json >/dev/null 2>&1 &
```
- 如果没有保活设置成功可以执行下面命令
- 保活命令（有时母鸡重启后，会删除所有进程的定时任务，所有发现要手机重新执行增加下面保活命令，让定时任务生效，不要问为什么，因为是免费的后遗证）
```
(crontab -l; echo "*/12 * * * * pgrep -x "web" > /dev/null || nohup /home/${USER}/.vmess/web run -c config.json >/dev/null 2>&1 &") | crontab -
```
