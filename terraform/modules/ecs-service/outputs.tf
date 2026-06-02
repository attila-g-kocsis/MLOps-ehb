output "cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.this.name
}

output "security_group_id" {
  description = "Security group ID attached to the task ENI"
  value       = aws_security_group.this.id
}
