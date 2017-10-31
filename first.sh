#!/bin/sh
#配置pm2用户
useradd -r -m -s /bin/bash pm2
echo "请输入密码"
passwd pm2
#添加pm2权限 
chmod u+w /etc/sudoers
echo "root ALL=(ALL) ALL 下面手动添加 \n  pm2  ALL=(ALL) ALL"
#生成key钥
ssh-keygen -t rsa -P ''
echo "ssh公私钥已生成请手动配置到pm2用户下"



#安装启动redis
  sudo  apt-get update
echo "System update completed"
  sudo  apt-get install redis
  sudo  service redis start
echo "redis 安装并启动服务"


#安装启动mongo
 echo "开始安装mogodb"  
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5

echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/testing multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

sudo apt-get update
#安装mongodb包
sudo apt-get install -y mongodb-org --allow-unauthenticated
#启动monog
  sudo service mongod start
echo "mongo启动并绑定外网0.0.0.0.27017" 

#安装node环境
echo "开始搭建node环境"
#下载
curl -O https://nodejs.org/dist/v6.11.4/node-v6.11.4.tar.gz
#解压
tar xvJf  node-v6.11.4.tar.gz
#重命名
mv  node-v6.11.4.tar.gz node
#移动
sudo mv node /opt/
#配置PATH
sudo ln -s /opt/node/bin/node /usr/local/bin/node 
sudo ln -s /opt/node/bin/npm /usr/local/bin/npm
#配置淘宝镜像cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
#配置path
sudo ln -s /opt/node/bin/cnpm /usr/local/bin/cnpm
echo "node npm/cnpm配置"

#安装PM2
echo "安装pm2"
npm install -g pm2
echo "安装完成"

# git 拉取代码
#安装git
sudo apt-get install git 
echo "git 安装配置完成"
cd  /home/pm2/
echo "git 拉取项目到home/pm2 \n 密码caoshiyuan123"
git clone http://shiyuan@www.mihua.biz:8888/dockerGroup/pm2.git
cd /home/pm2/pm2/manage_service/ 
npm install 
cd /home/pm2/pm2/customer_service
npm install
cd /home/pm2/pm2/manage_service/
pm2 start bin/www --name "kaihu"


