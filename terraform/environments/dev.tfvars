environment = "dev"
aws_region  = "eu-west-1"


s3_buckets = [
  {
    key  = "tf-remote-dev-ehb-ako"
    tags = {}
  }
]

ecr_repositories = [
  {
    key                  = "mlops-course-ehb-ako"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration = {
      scan_on_push = true
    }
    tags = {}
  }
]

ecs_services = [
  {
    key            = "ecs-mlops-course-ehb-ako"
    ecr_repository = "ecr-mlops-course-ehb-ako"
    image_tag      = "latest"
    container_port = 80
    cpu            = 256
    memory         = 512
    desired_count  = 1
    tags           = {}
  }
]