resource "aws_cloudwatch_event_rule" "creeper-schedule-rule" {
    name        = "creeper-schedule"
    description = "Run creeper bi-weekly"

    schedule_expression = "rate (2 hours)"
}

resource "aws_cloudwatch_event_target" "creeper-schedule-target" {
  rule      = "${aws_cloudwatch_event_rule.creeper-schedule-rule.name}"
  arn       = "${aws_lambda_function.creeper-function.arn}"
}