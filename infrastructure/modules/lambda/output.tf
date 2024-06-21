output "lambda_arn" {
  value = aws_lambda_function.backend.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.backend.function_name
}
