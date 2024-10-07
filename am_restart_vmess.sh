#!/bin/bash

# 检查进程是否在运行
pgrep -x "web" > /dev/null

# 如果没有运行，则启动 vmess
if [ $? -ne 0 ]; then
    nohup /home/${USER}/.vmess/web run -c /home/${USER}/.vmess/config.json >/dev/null 2>&1 &
fi


# 检查进程是否在运行
pgrep -x "bot" > /dev/null

# 默认隧道保活命令， <你的面板开通端口> 要修改你的端口
if [ $? -ne 0 ]; then
    nohup /home/${USER}/.vmess/bot tunnel --edge-ip-version auto --no-autoupdate --protocol http2 --logfile /home/${USER}/.vmess/boot.log --loglevel info --url http://localhost:<你的面板开通端口> >/dev/null 2>&1 &
fi

# token固定隧道保活命令， <ARGO_AUTH> 要修改你的token
if [ $? -ne 0 ]; then
    nohup /home/${USER}/.vmess/bot tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token <ARGO_AUTH> >/dev/null 2>&1 &
fi

# json固定隧道保活命令
if [ $? -ne 0 ]; then
    nohup /home/${USER}/.vmess/bot tunnel --edge-ip-version auto --config tunnel.yml run >/dev/null 2>&1 &
fi


