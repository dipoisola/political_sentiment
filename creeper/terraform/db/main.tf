variable "db-uri" {
  default = ""
}


output "db-uri" {
  value = "${ local.created == 1 ? data.aws_ssm_parameter.db.value : var.db-uri }"
}

terraform {
  backend "s3" {
    bucket = "strongbank"
    region  = "us-east-1"
    key    = "terraform/creeper-db.state"
  }
}

data "aws_ssm_parameter" "db" {
  name = "db-uri"
}
resource "aws_ssm_parameter" "db" {
  count = "${ local.created  == 1 ? 0 : 1}"
  name  = "db-uri"
  type  = "SecureString"
  value = "${var.db-uri}"
}

locals {
  created = "${length(data.aws_ssm_parameter.db.value) > 0}"
}
