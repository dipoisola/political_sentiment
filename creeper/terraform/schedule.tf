resource "aws_cloudwatch_event_rule" "creeper-schedule-rule" {
  name        = "creeper-schedule"
  description = "Run creeper bi-hourly"

  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions
  schedule_expression = "cron(* 1/2 * * ? *)"
}

resource "aws_cloudwatch_event_target" "creeper-schedule-target" {
  rule = "${aws_cloudwatch_event_rule.creeper-schedule-rule.name}"
  arn  = "${aws_lambda_function.creeper-function.arn}"
}
