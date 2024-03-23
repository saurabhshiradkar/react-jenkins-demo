module.exports = {
    apps: [
      {
        name: 'react-jenkins-demo',
        script: 'npm',
        args: 'start',
        cwd: '/var/nodeapp/react-jenkins-demo',// React app's directory
        // interpreter: 'none',
        // autorestart: true,
        // watch: false,
        // max_memory_restart: '1G',
        env: {
          NODE_ENV: 'production',
          PORT : 3000
        },
      },
    ],
  };
  