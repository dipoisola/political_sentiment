variable shared_role_arn {
  type = "string"
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 1.35"

  assume_role {
    role_arn = "${var.shared_role_arn}"
  }
}

provider "archive" {
  version = "~> 1.1"
}
