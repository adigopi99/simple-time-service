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


- **Terraform**: 
--------------------
1. sudo yum install -y yum-utils shadow-utils
2. sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
3. sudo yum -y install terraform

)
**AWS CLI**: 
-------------------
1. curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
2. unzip awscliv2.zip
3. sudo ./aws/install
3. aws configure

AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
Default region name [None]: us-west-2
Default output format [None]: json


** kubevtl**:
-------------------
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo mv kubectl /usr/local/run

**eksctl**:
-----------------
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin



1. Clone the repository:
   git clone https://github.com/adigopi99/simple-time-service.git
   cd simple-time-service
   


