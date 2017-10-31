#!/bin/sh
cd /home/project/customer_service
docker-compose up -d 
#docker run -d -p 27017:27017 --name mongo1 mongo/self
#docker exec -i -t mongo1  mongo 127.0.0.1:27017/db --quiet common.js
docker cp common.js customerservice_mongo_1:/data
docker exec -i -t customerservice_mongo_1  mongo 127.0.0.1:27017/online_cs --quiet /data/common.js
docker-compose up -d
