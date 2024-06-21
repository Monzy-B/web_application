variable "lambda_function_name" {
  description = "Name of the Lambda function to monitor"
}

variable "db_instance_identifier" {
  description = "Identifier of the RDS DB instance to monitor"
}

variable "alarm_action_arn" {
  description = "SNS Topic ARN for CloudWatch Alarms"
}
