# SimpleTimeService

# Description
SimpleTimeService is a web service that returns the current timestamp and the visitor's IP address.

# Prerequisites
- Docker :
-----------------
1. sudo yum install docker -y
2. sudo usermod -aG docker ec2-user 
3. sudo systemctl restart docker 
4. exit
5. relogin

# building and tag :  docker build -t gopiadi/simple-time-service .
# Run : docker run -d -p 3000:3000  gopiadi/simple-time-service


- Node.js 
-------------
1. curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
2. source ~/.bashrc
3. nvm install 14
4. nvm use 14
5. nvm alias default 14
6. node -v
7. npm -v

 

- Git 
----------
sudo yum install git -y

# Setup Instructions

# To Build and Run the Docker Container:

1. Clone the repository:

   git clone https://github.com/adigopi99/Assessment-Project.git
   cd Assessment-Project

