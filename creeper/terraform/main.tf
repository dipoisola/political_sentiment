
data "aws_lambda_function" "creeper" {
  function_name = "creeper"
}

resource "aws_lambda_function" "creeper-function" {
  filename         = "creeper.zip"
  function_name    = "${data.aws_lambda_function.creeper.function_name}"
  role             = "${aws_iam_role.creeper-iam-role.arn}"
  handler          = "creeper.Main::fetchTweets"
  source_code_hash = "${base64sha256(file("creeper.zip"))}"
  runtime          = "java8"
}