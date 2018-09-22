data "aws_iam_policy_document" "creeper-policy" {
  statement {
    sid = "1"

    actions = ["sts:AssumeRole"]

    principals = {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "creeper-iam-role" {
  name               = "creeper-function-role"
  assume_role_policy = "${data.aws_iam_policy_document.creeper-policy.json}"
}

data "aws_iam_policy_document" "circle-ci-policy-doc" {
  statement {
    actions = [
      "lambda:UpdateFunctionCode",
    ]

    resources = [
      "${aws_lambda_function.creeper-function.arn}",
    ]
  }
}

variable "circle-ci" {
  default = "circle-ci"
}

resource "aws_iam_policy" "circle-ci-policy" {
  name        = "Circle-CI-policy"
  description = "Circle CI updates Lambda source code"
  policy      = "${data.aws_iam_policy_document.circle-ci-policy-doc.json}"
}

resource "aws_iam_user_policy_attachment" "circle-ci-policy-attachment" {
  user       = "${var.circle-ci}"
  policy_arn = "${aws_iam_policy.circle-ci-policy.arn}"
}
