variable shared_role_arn {
  type = "string"
}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn     = "${var.shared_role_arn}"
  }
}
