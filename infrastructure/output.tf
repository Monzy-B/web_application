output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "amplify_app_id" {
  value = module.amplify.amplify_app_id
}

output "amplify_branch_url" {
  value = module.amplify.amplify_branch_url
}

output "codepipeline_arn" {
  value = module.codepipeline.codepipeline_arn
}

output "cloudwatch_alarm_arns" {
  value = module.cloudwatch.cloudwatch_alarm_arns
}
