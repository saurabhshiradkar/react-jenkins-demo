

#!/bin/bash

# Destination directory
DEST_DIR="/var/nodeapp/react-jenkins-demo"

# Clean the destination directory
rm -rf $DEST_DIR/*

# Copy files from Jenkins workspace to destination directory
cp -r /var/lib/jenkins/workspace/nodeapp/* $DEST_DIR/

# Navigate to the destination directory
cd $DEST_DIR

# Find the process PID of instance 3000
PID=$(lsof -t -i :3000)

# If the PID is not empty then kill it
if [ -n "$PID" ]; then 
    su -c "kill -9 $PID" -s /bin/bash root
fi

# stop pm2 process
sudo pm2 stop ecosystem.config.js

# install nodejs
sudo npm install

# start app with pm2
sudo pm2 start ecosystem.config.js

# Output
echo "The Deployment is successful, running on port 3000 with a new PID of instance & pm2"
