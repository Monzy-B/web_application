variable "github_repository" {
  description = "GitHub repository name"
}

variable "github_branch" {
  description = "GitHub branch name"
}

variable "amplify_app_id" {
  description = "AWS Amplify App ID"
}

variable "amplify_branch" {
  description = "AWS Amplify Branch"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
}

variable "codebuild_project_name" {
  description = "Name of the CodeBuild project"
}

variable "codepipeline_bucket_name" {
  description = "Name of the S3 bucket for CodePipeline artifacts"
}

variable "codepipeline_role_arn" {
  description = "IAM Role ARN for CodePipeline"
}

variable "github_connection_arn" {
  description = "CodeStar Connection ARN for GitHub"
}
