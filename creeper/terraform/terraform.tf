terraform {
  backend "s3" {
    bucket = "strongbank"
    region  = "us-east-1"
    key    = "terraform/creeper.state"
  }
}