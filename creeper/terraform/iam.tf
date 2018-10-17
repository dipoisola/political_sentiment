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

data "aws_iam_policy_document" "ci-policy-doc" {
  statement {
    actions = [
      "lambda:UpdateFunctionCode",
    ]

    resources = [
      "${aws_lambda_function.creeper-function.arn}",
    ]
  }
}

variable "ci-user" {
  default = "circle-ci"
}

resource "aws_iam_policy" "ci-policy" {
  name        = "update-creeper-code-policy"
  policy      = "${data.aws_iam_policy_document.ci-policy-doc.json}"
}

resource "aws_iam_user_policy_attachment" "ci-policy-attachment" {
  user       = "${var.ci-user}"
  policy_arn = "${aws_iam_policy.ci-policy.arn}"
}
