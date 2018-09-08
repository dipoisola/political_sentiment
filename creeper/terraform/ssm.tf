data "terraform_remote_state" "config" {
  backend = "s3"
  config  {
    bucket = "strongbank"
    region  = "us-east-1"
    key    = "terraform/creeper.state"
    region = "us-east-1"
  }
}

resource "aws_ssm_parameter" "db" {
    name = "db-uri"
    type  = "SecureString"
    value = "${data.terraform_remote_state.config.db-uri}"
}
