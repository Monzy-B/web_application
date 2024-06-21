resource "aws_codepipeline" "webapp_pipeline" {
  name     = "webapp-pipeline"
  role_arn = var.codepipeline_role_arn

  artifact_store {
    type     = "S3"
    location = var.codepipeline_bucket_name
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]
      configuration = {
        ConnectionArn   = var.github_connection_arn
        FullRepositoryId = var.github_repository
        BranchName      = var.github_branch
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name             = "DeployFrontend"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "Amplify"
      version          = "1"
      input_artifacts  = ["build_output"]
      configuration = {
        AppId      = var.amplify_app_id
        BranchName = var.amplify_branch
      }
    }

    action {
      name             = "DeployBackend"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "Lambda"
      version          = "1"
      input_artifacts  = ["build_output"]
      configuration = {
        FunctionName = var.lambda_function_name
      }
    }
  }
}
