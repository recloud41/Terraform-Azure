output "load_balancer_dns_name" {
  value = aws_lb.eks_lb.dns_name
}
