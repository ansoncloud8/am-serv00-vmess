# [am-serv00-vmess](https://github.com/amclubs/am-serv00-vmess)
这个项目的脚本安装管理并运行一个VMess节点,并可以通过Cloudflare的CDN设置域名回源进行加速,解锁ChatGPT、TikTok、其它流媒体、小网站等

#
▶️ **新人[YouTube](https://youtube.com/@am_clubs?sub_confirmation=1)** 需要您的支持，请务必帮我**点赞**、**关注**、**打开小铃铛**，***十分感谢！！！*** ✅
</br>🎁请 **follow** 我的[GitHub](https://github.com/amclubs)、给我所有项目一个 **Star** 星星（拜托了）！你的支持是我不断前进的动力！ 💖
</br>✅**解锁更多技能** [加入TG群【am_clubs】](https://t.me/am_clubs)、[YouTube频道【@am_clubs】](https://youtube.com/@am_clubs?sub_confirmation=1)、[【博客(国内)】](https://amclubss.com)、[【博客(国际)】](https://amclubs.blogspot.com) 
</br>✅点击观看教程[CLoudflare免费节点](https://www.youtube.com/playlist?list=PLGVQi7TjHKXbrY0Pk8gm3T7m8MZ-InquF) | [VPS搭建节点](https://www.youtube.com/playlist?list=PLGVQi7TjHKXaVlrHP9Du61CaEThYCQaiY) | [获取免费域名](https://www.youtube.com/playlist?list=PLGVQi7TjHKXZGODTvB8DEervrmHANQ1AR) | [免费VPN](https://www.youtube.com/playlist?list=PLGVQi7TjHKXY7V2JF-ShRSVwGANlZULdk) | [IPTV源](https://www.youtube.com/playlist?list=PLGVQi7TjHKXbkozDYVsDRJhbnNaEOC76w) | [Mac和Win工具](https://www.youtube.com/playlist?list=PLGVQi7TjHKXYBWu65yP8E08HxAu9LbCWm) | [AI分享](https://www.youtube.com/playlist?list=PLGVQi7TjHKXaodkM-mS-2Nwggwc5wRjqY)


# 免费serv00服务器一键脚本部署VMess
## [视频教程](https://youtu.be/6UZXHfc3zEU)

# 部署教程：

## 一、需要准备的前提资料
### 1、首先注册一个Serv00账号，建议使用gmail邮箱注册，注册好会有一封邮箱上面写着你注册时的用户名和密码
- 注册帐号地址：https://serv00.com
<center>注册帐号请查看下面视频</center>
<center><a href="https://youtu.be/NET1FTlfDTs">[点击观看视频教程]</a></center>

![image](https://github.com/user-attachments/assets/57c3ff7b-ae42-42c0-87ac-acb1b5bd177a)

### 2、加下群发送关键字 ssh 获取连接工具
Telegram频道：[@AM_CLUBS](https://t.me/AM_CLUBS)

## 二、安装前需准备的初始设置
- 1、登入邮件里面发你的 DevilWEB webpanel 后面的网址，进入网站后点击 Change languag 把面板改成英文
- 2、然后在左边栏点击 Additonal services ,接着点击 Run your own applications 看到一个 Enable 点击
- 3、找到 Port reservation 点击后面的 Add Port 新开一个端口，随便写，也可以点击 Port后面的 Random随机选择Port tybe 选择 TCP
- 4、然后点击 Port list 你会看到一个端口
![image](https://github.com/user-attachments/assets/1b11ebdb-49e6-427d-a074-f51d52235f7e)


- 5、 启用管理权限：
<img width="800" height="600" alt="serv00" src="https://github.com/user-attachments/assets/48466f3a-1b75-4cf3-8dd9-7c2e440b73fe">

***完成此步骤后，退出 SSH 并再次登录。***

## 三、开始安装部署

- 1、用我们前面下载的工具登入SSH(有些工具 第一次连接还是会弹出输出密码记得点X 然后再添加密码 )
使用 serv00 通过电子邮件发送给您的信息（下面username、panel要修改成你邮箱收到对应的信息）。
```
ssh <username>@<panel>.serv00.com
```

- 2、进入到面板后复制下面代码一键安装
```
bash <(curl -Ls https://raw.githubusercontent.com/amclubs/am-serv00-vmess/main/install_serv00_vmess.sh)
```

- 3、保活命令（有时母鸡重启后，会删除所有进程和定时任务，所以要手工重新执行下面保活命令，让定时任务生效，不要问为什么，因为是免费的后遗证）
```
(crontab -l; echo "*/12 * * * * pgrep -x "web" > /dev/null || nohup /home/${USER}/.vmess/web run -c /home/${USER}/.vmess/config.json >/dev/null 2>&1 &") | crontab -
```
### 隧道保活命令情况如下
- 默认隧道保活命令， <你的面板开通端口> 要修改你的端口
```
(crontab -l; echo "*/12 * * * * pgrep -x "bot" > /dev/null || nohup /home/${USER}/.vmess/bot tunnel --edge-ip-version auto --no-autoupdate --protocol http2 --logfile /home/${USER}/.vmess/boot.log --loglevel info --url http://localhost:<你的面板开通端口> >/dev/null 2>&1 &") | crontab -
```
- token固定隧道保活命令， <ARGO_AUTH> 要修改你的token
```
(crontab -l; echo "*/12 * * * * pgrep -x "bot" > /dev/null || nohup /home/${USER}/.vmess/bot tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token <ARGO_AUTH> >/dev/null 2>&1 &") | crontab -
```
- json固定隧道保活命令
```
(crontab -l; echo "*/12 * * * * pgrep -x "bot" > /dev/null || nohup /home/${USER}/.vmess/bot tunnel --edge-ip-version auto --config tunnel.yml run >/dev/null 2>&1 &") | crontab -
```


- 查看保活crontab任务
```
crontab -l
```
- 上面命令完会显示下面信息就是有保活设置成功
```
*/12 * * * * pgrep -x "web" > /dev/null || nohup /home/${USER}/.vmess/web run -c /home/${USER}/.vmess/config.json >/dev/null 2>&1 &
```

## 四、测试节点
- 1、把安装成功返回的节点信息复制到订阅工具里就可以使用

- 2、如果不记得节点配置，可以通过下面信息查看
```
cat /home/${USER}/.vmess/list.txt
```
- 3、节点通过Cloudflare的CDN设置域名回源进行加速
- CF端口类型

HTTP：80，8080，8880，2052，2082，2086，2095

HTTPS：443，2053，2083，2087，2096，8443

- 4、请查看视频教程（Cloudflare的CDN设置域名回源进行加速） [视频教程](https://youtu.be/6UZXHfc3zEU)
- 5、[免费域名注册教程](https://youtu.be/cI36vtXuQrM)

## 五、卸载VMess
### 一键卸载命令，根据提示，选择2（2. 卸载sing-box） 直接卸载完成
```
bash <(curl -Ls https://raw.githubusercontent.com/amclubs/am-serv00-vmess/main/install_serv00_vmess.sh)
```

# 
<center>
<details><summary><strong> [点击展开] 赞赏支持 ~🧧</strong></summary>
*我非常感谢您的赞赏和支持，它们将极大地激励我继续创新，持续产生有价值的工作。*

- **USDT-TRC20:** `TWTxUyay6QJN3K4fs4kvJTT8Zfa2mWTwDD`
- **TRX-TRC20:** `TWTxUyay6QJN3K4fs4kvJTT8Zfa2mWTwDD`

<div align="center"> 
  <img src="https://github.com/user-attachments/assets/e6cdc42a-6374-4722-b833-601738f72196" width="200"></br> 
  TRC10/TRC20扫码支付 
</div> 
</details>
</center>

 #
 免责声明:
 - 1、该项目设计和开发仅供学习、研究和安全测试目的。请于下载后 24 小时内删除, 不得用作任何商业用途, 文字、数据及图片均有所属版权, 如转载须注明来源。
 - 2、使用本程序必循遵守部署服务器所在地区的法律、所在国家和用户所在国家的法律法规。对任何人或团体使用该项目时产生的任何后果由使用者承担。
 - 3、作者不对使用该项目可能引起的任何直接或间接损害负责。作者保留随时更新免责声明的权利，且不另行通知。
 
