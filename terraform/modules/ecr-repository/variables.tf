variable "name" {
  description = "(Required) Name of the ECR repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "(Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE."
  type        = string
  default     = "MUTABLE"
}

variable "image_scanning_configuration" {
  description = "(Optional) Configuration block that defines image scanning configuration for the repository."
  type = object({
    scan_on_push = bool
  })
  default = {
    scan_on_push = true
  }
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to resource."
}
