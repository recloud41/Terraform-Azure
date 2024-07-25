# variables.tf

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS cluster version"
  default     = "1.21"
}

variable "subnets" {
  description = "Subnets for EKS cluster"
  type        = list(string)
  default     = ["subnet-xxxxxxx", "subnet-yyyyyyy"]
}

variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-xxxxxxx"
}

variable "worker_instance_type" {
  description = "Worker instance type"
  default     = "t3.medium"
}


variable "worker_asg_min_size" {
  description = "Worker ASG minimum size"
  default     = 1
}

variable "worker_asg_max_size" {
  description = "Worker ASG maximum size"
  default     = 3
}

variable "worker_desired_size" {
  description = "Worker ASG desired size"
  default     = 2
}

variable "rds_identifier" {
  description = "RDS instance identifier"
  default     = "my-rds-instance"
}

variable "rds_engine" {
  description = "RDS database engine"
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "RDS engine version"
  default     = "8.0.26"
}

variable "rds_port" {
  description = "RDS Port"
  default     = "5432"
}
#
variable "maintenance_window" {
  description = "Maintenance window for RDS instance"
  default     = "Mon:00:00-Mon:03:00"  # Adjust the maintenance window as per your requirements
}

variable "rds_allocated_storage" {
  description = "RDS Allocated Storage"
  default     = "20"
}

variable "rds_instance_class" {
  description = "The RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
variable "rds_name" {
  description = "The name of the RDS instance"
  type        = string
  default     = "my-rds-instance123"
}
variable "rds_username" {
  description = "Username of the RDS"
  type        = string
  default     =   "otelrds1"
}
variable "rds_password" {
  description = "Password for the RDS"
  type        = string
  default     = "Otel123#4@"  
}
variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type        = string
  default     = "value"  
}
variable "rds_subnet_ids" {
  type        = string
  description = "rds_subnet_ids"
  default     = "value"  
}
variable "backup_window" {
  description = "The backup window for the RDS instance"
  type        = string
  default     = "07:00-09:00"
}
