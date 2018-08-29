data "aws_iam_policy_document" "creeper_policy_document" {
  statement {
    sid = "1"

    actions = [
      "lambda:InvokeFunction",
    ]

    resources = [
      "${aws_lambda_function.creeper_function.arn}",
    ]
  }
}



resource "aws_iam_role" "creeper_iam_role" {
    name = "creeper_function_role"
    assume_role_policy = "${creeper_policy_document}"
}