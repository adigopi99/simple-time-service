## Description
This repository contains the infrastructure setup and deployment configuration for hosting the **SimpleTimeService** web application on AWS using **Terraform**. The application is containerized with Docker, and Terraform is used to provision the required AWS resources.

The infrastructure includes:
- A **VPC** with 2 public and 2 private subnets.
- An **EKS (Elastic Kubernetes Service)** cluster to host the Docker container.
- A **Security Group** to allow traffic to the service.
- A **Load Balancer** to route traffic to the ECS service.
- The **SimpleTimeService** Docker container deployed on the EKS cluster.

## Prerequisites

Before deploying the infrastructure, make sure you have the following installed:

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

