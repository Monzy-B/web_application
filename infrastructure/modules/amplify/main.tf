resource "aws_amplify_app" "app" {
  name = "my-amplify-app"
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.app.id
  branch_name = var.amplify_branch
}
