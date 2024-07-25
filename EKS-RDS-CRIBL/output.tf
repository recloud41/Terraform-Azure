output "cluster_id" {
  value       = element(concat(aws_eks_cluster.this[*].id, tolist(["a,b,c"])), 0)
  description = "The ID of the EKS cluster"
}
output "cloudwatch_log_group_arn" {
  value       = element(concat(aws_cloudwatch_log_group.this[*].arn, tolist(["a,b,c"])), 0)
  description = "The ARN of the CloudWatch log group"
}
output "cluster_version" {
  value       = element(concat(aws_eks_cluster.this[*].version, tolist(["a,b,c"])), 0)
  description = "The version of the EKS cluster"
}
output "cluster_certificate_authority_data" {
  value       = element(concat(aws_eks_cluster.this[*].certificate_authority[0].data, totolist(["a,b,c"])), 0)
  description = "The data of the EKS cluster certificate authority"
}
