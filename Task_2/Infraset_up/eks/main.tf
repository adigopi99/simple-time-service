provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

# Data block to reference your existing VPC
data "aws_vpc" "existing_vpc" {
  id = "vpc-xxxxxxxx"  # Replace with your existing VPC ID
}

# Data block to reference your existing subnets
data "aws_subnet" "public_subnet" {
  id = "subnet-xxxxxxxx"  # Replace with your existing public subnet ID
}

data "aws_subnet" "private_subnet" {
  id = "subnet-yyyyyyyy"  # Replace with your existing private subnet ID
}

# Create an IAM role for EKS worker nodes
resource "aws_iam_role" "eks_node_role" {
  name = "eks_node_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })

  tags = {
    Name = "eks_node_role"
  }
}

# Attach policies to the worker node role
resource "aws_iam_role_policy_attachment" "eks_node_policy_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_CNI_policy_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "eks_AmazonEC2ContainerRegistry_read_only" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Create the EKS Cluster in the existing VPC
resource "aws_eks_cluster" "main_cluster" {
  name     = "gopi-eks-cluster"
  role_arn = aws_iam_role.eks_node_role.arn

  vpc_config {
    subnet_ids = [
      data.aws_subnet.public_subnet.id,
      data.aws_subnet.private_subnet.id
    ]
    endpoint_public_access = true
    endpoint_private_access = true
  }

  depends_on = [aws_iam_role_policy_attachment.eks_node_policy_attachment]
}

# Create a Node Group with 1 node
resource "aws_eks_node_group" "main_node_group" {
  cluster_name    = aws_eks_cluster.main_cluster.name
  node_group_name = "gopi-node-group"
  node_role       = aws_iam_role.eks_node_role.arn
  subnet_ids      = [data.aws_subnet.public_subnet.id]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t3.medium"] # Change to your preferred instance type

  depends_on = [
    aws_eks_cluster.main_cluster
  ]
}

# Output EKS Cluster details
output "eks_cluster_name" {
  value = aws_eks_cluster.main_cluster.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main_cluster.endpoint
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.main_cluster.arn
}

output "eks_node_group_name" {
  value = aws_eks_node_group.main_node_group.node_group_name
}

output "eks_node_group_status" {
  value = aws_eks_node_group.main_node_group.status
}

