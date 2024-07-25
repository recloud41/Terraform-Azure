# eks

provider "aws" {
  region = var.region
}

module "eks_cluster" {
  source              = "terraform-aws-modules/eks/aws"
  version             = "14.0.0"  # Replace with the desired version of the module
  cluster_name        = "my-eks-cluster"  # Replace with your desired EKS cluster name
  cluster_version     = "1.21"  # Replace with your desired EKS cluster version
  vpc_id              = module.vpc.vpc_id
  subnets             = module.vpc.private_subnets
  worker_groups       = [
    {
      instance_type = "t3.medium"  # Replace with your desired worker instance type
      asg_max_size  = 3  # Replace with your desired maximum worker group size
    }
  ]
}

module "vpc" {
  source              = "terraform-aws-modules/vpc/aws"
  version             = "5.0.0"  # Replace with the desired version of the module
  name                = "my-vpc1"  # Replace with your desired VPC name
  cidr                = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
  azs                 = ["us-west-2a", "us-west-2b", "us-west-2c"]  # Replace with your desired availability zones
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]  # Replace with your desired public subnet CIDR blocks
  private_subnets     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]  # Replace with your desired private subnet CIDR blocks
}


module "rds_instance" {
  source = "terraform-aws-modules/rds/aws"
  version = "3.0.0"

  identifier            = var.rds_identifier
  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  instance_class        = var.rds_instance_class
  allocated_storage     = var.rds_allocated_storage
  name                  = var.rds_name
  username              = var.rds_username
  password              = var.rds_password
  vpc_security_group_ids = var.rds_vpc_security_group_ids
  subnet_ids            = var.rds_subnet_ids
  port                  = var.rds_port
  backup_window         = var.backup_window 
  maintenance_window    = var.maintenance_window 
}
#lb

variable "cluster_name1" {
  description = "Name of the existing EKS cluster"
}

resource "aws_lb" "eks_lb" {
  name               = "eks-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.eks_lb_sg.id]
  subnets            = [var.subnet_id]
}

resource "aws_security_group" "eks_lb_sg" {
  name        = "eks-lb-sg"
  description = "Security group for the EKS load balancer"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your desired source IP range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#pv
# main.tf

provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}

resource "kubernetes_persistent_volume" "example_pv" {
  metadata {
    name = "example-pv"
  }

  spec {
    capacity "capacity of the kubernetes_persistent_volume" {
      storage = "10Gi"
    }
    persistent_volume_source {
      # Define the source of the persistent volume, such as a host path or a cloud provider-specific volume.
      # Example:
      host_path {
        path = "/data"
        type = "Directory"
      }
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name = "standard"  # Modify with your desired storage class
    
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name = "example-log-group"
}

resource "aws_eks_cluster" "this" {
  name     = "example-cluster"
  role_arn = aws_iam_role.cluster.arn
}



