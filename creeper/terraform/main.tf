data "archive_file" "creeper-zip" {
  type                    = "zip"
  source_content          = "# nothing to do"
  source_content_filename = "creeper.Main::fetchTweets"
  output_path             = "${path.module}/creeper.zip"
}

resource "aws_lambda_function" "creeper-function" {
  filename         = "${path.module}/creeper.zip"
  function_name    = "creeper"
  role             = "${aws_iam_role.creeper-iam-role.arn}"
  handler          = "creeper.Main::fetchTweets"
  source_code_hash = "${data.archive_file.creeper-zip.output_base64sha256}"
  runtime          = "java8"

  environment {
    variables = {
      DB_URI = "${module.db.db-uri}"
      BUCKET = "${module.bkt.name}"
    }
  }
}
