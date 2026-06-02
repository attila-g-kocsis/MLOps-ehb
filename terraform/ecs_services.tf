data "aws_caller_identity" "current" {}

locals {
  ecr_registry = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
}

module "ecs_service" {
  source = "./modules/ecs-service"

  for_each = { for svc in var.ecs_services : svc.key => svc }

  name           = each.value.key
  image_uri      = "${local.ecr_registry}/${each.value.ecr_repository}:${each.value.image_tag}"
  container_port = each.value.container_port
  cpu            = each.value.cpu
  memory         = each.value.memory
  desired_count  = each.value.desired_count
  tags           = each.value.tags
}
