output "cloudwatch_alarm_arns" {
  value = [
    aws_cloudwatch_metric_alarm.lambda_errors.arn,
    aws_cloudwatch_metric_alarm.rds_cpu_utilization.arn
  ]
}
