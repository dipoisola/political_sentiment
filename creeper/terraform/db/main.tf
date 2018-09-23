variable "db-uri" {
  type = "string"
}

locals {
  db_uri = "${coalesce(var.db-uri, data.aws_ssm_parameter.db.value)}"
}

data "aws_ssm_parameter" "db" {
  name = "db-uri"
}

resource "aws_ssm_parameter" "db" {
  name  = "db-uri"
  type  = "SecureString"
  value = "${local.db_uri}"
  overwrite = true
}


output "db-uri" {
  value = "${local.db_uri}"
}