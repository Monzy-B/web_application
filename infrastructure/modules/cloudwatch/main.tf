resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "LambdaErrors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Alert if lambda function errors"
  alarm_actions       = [var.alarm_action_arn]
  dimensions = {
    FunctionName = var.lambda_function_name
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_utilization" {
  alarm_name          = "RDSCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alert if RDS CPU utilization exceeds 80%"
  alarm_actions       = [var.alarm_action_arn]
  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
}
