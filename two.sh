#!/bin/sh
  time=`date`
#配置pm2用户
userdel pm3
useradd -r -m -s /bin/bash pm3
passwd  pm3|echo "请输入密码" 
chmod +w /etc/sudoers
echo "提示:\n      添加用户的root权限
           \n      vim /etc/sudoers 
           \n      ALL=(ALL) ALL 下面手动添加  pm2  ALL=(ALL) ALL"
sleep 3
#生成key钥
ssh-keygen -t rsa -P ''
echo "提示:\n /root/.ssh 
      \n 公钥手动配置到pm2用户下"
sleep 3


#安装启动redis
# sudo  apt-get update
  echo "System update completed"
if sudo  apt-get install redis ;then
   echo "redis is complete"
else 
   echo "redis is failed"
   echo "redis 安装失败请重新安装"
fi
sudo  service redis start
echo "redis 安装并启动服务"
