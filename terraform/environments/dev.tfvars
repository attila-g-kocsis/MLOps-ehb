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
    key                  = "mlops-course-ehb-ecr-repository-ako"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration = {
      scan_on_push = true
    }
    tags = {}
  }
]
