variable "db-uri" {
  default = ""
}


output "db-uri" {
  value = "${var.db-uri}"
}

terraform {
  backend "s3" {
    bucket = "strongbank"
    region  = "us-east-1"
    key    = "terraform/creeper-db.state"
  }
}

resource "aws_ssm_parameter" "db" {
  name  = "db-uri"
  type  = "SecureString"
  value = "${var.db-uri}"
}


variable shared_role_arn {
  type = "string"
}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn     = "${var.shared_role_arn}"
  }
}
