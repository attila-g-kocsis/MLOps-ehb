variable "name" {
  description = "(Required) Base name used for the cluster, service, task family, log group, IAM role, and security group."
  type        = string
}

variable "image_uri" {
  description = "(Required) Full container image URI to deploy (e.g., <account>.dkr.ecr.<region>.amazonaws.com/<repo>:<tag>)."
  type        = string
}

variable "container_port" {
  description = "(Optional) TCP port the container listens on. Also opened in the security group."
  type        = number
  default     = 80
}

variable "cpu" {
  description = "(Optional) Fargate task CPU units. 256 = 0.25 vCPU."
  type        = number
  default     = 256
}

variable "memory" {
  description = "(Optional) Fargate task memory in MiB."
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "(Optional) Number of tasks the service keeps running."
  type        = number
  default     = 1
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to resources."
}
