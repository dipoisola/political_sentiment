data "aws_iam_policy_document" "creeper-policy" {
  statement {
    sid = "1"

    actions = ["sts:AssumeRole"]

    principals = {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}



resource "aws_iam_role" "creeper-iam-role" {
    name = "creeper-function-role"
    assume_role_policy = "${data.aws_iam_policy_document.creeper-policy.json}"
}