resource "aws_ecr_repository" "gf-hack-ecr" {
  for_each = toset(var.repositoryNames)

  name = each.key

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

}