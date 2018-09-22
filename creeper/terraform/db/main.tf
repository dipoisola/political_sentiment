variable "db-uri" {
  default = ""
}

output "db-uri" {
  value = "${aws_ssm_parameter.db.value}"
}

terraform {
  backend "s3" {
    bucket = "strongbank"
    region = "us-east-1"
    key    = "terraform/creeper-db.state"
  }
}

data "aws_ssm_parameter" "db" {
  name = "db-uri"
}

resource "aws_ssm_parameter" "db" {
  name  = "db-uri"
  type  = "SecureString"
  value = "${coalesce(var.db-uri, data.aws_ssm_parameter.db.value)}"
  overwrite = true
}
