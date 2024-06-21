variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "db_username" {
  description = "Database Username"
  default     = "admin"
}

variable "db_password" {
  description = "Database Password"
}

variable "amplify_app_id" {
  description = "AWS Amplify App ID"
}

variable "amplify_branch" {
  description = "AWS Amplify Branch"
}

variable "github_repository" {
  description = "GitHub repository name"
}

variable "github_branch" {
  description = "GitHub branch name"
}

variable "alarm_action_arn" {
  description = "SNS Topic ARN for CloudWatch Alarms"
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

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
