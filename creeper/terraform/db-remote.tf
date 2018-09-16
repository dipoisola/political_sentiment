data "terraform_remote_state" "config" {
  backend = "s3"

  config {
    bucket = "strongbank"
    region = "us-east-1"
    key    = "terraform/creeper-db.state"
    region = "us-east-1"
  }
}
