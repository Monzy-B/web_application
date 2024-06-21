resource "aws_lambda_function" "backend" {
  filename         = "function.zip"
  function_name    = "my-function"
  role             = var.iam_role
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [var.security_group_id]
  }

}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.backend.function_name
  principal     = "apigateway.amazonaws.com"

}
