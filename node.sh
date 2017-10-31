# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
day=`date`
if node -v
  then 
    echo "$day nodejs is completed" >> 1.log	
  else
   sleep 3
     echo "$day node -v is faild" >> 2.log
fi 
