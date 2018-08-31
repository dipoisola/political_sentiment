data "aws_iam_policy_document" "creeper-policy-document" {
  statement {
    sid = "1"

    actions = [
      "lambda:InvokeFunction",
    ]

    resources = [
      "${aws_lambda_function.creeper-function.arn}",
    ]
  }
}



resource "aws_iam_role" "creeper-iam-role" {
    name = "creeper-function-role"
    assume_role_policy = "${data.aws_iam_policy_document.creeper-policy-document}"
}