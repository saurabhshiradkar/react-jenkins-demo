#!/bin/bash

# copy to project dir
cp -r * /var/nodeapp/react-jenkins-demo

# navigate to dir
cd /var/nodeapp/react-jenkins-demo

# find the process pid of instance 300
PID=$(lsof -t -i :3000)

# if the pid is not empty then kill it
if [ -n "$PID" ]; then 
    su -c "kill -9 $PID" -s /bin/bash root
fi

# stop pm2 process
pm2 stop ecosystem.config.js

# install nodejs
npm install

# start app with pm2
pm2 start ecosystem.config.js

# output
echo "The Deployment is successful, running on port 3000 with new pid of instance & pm2"
