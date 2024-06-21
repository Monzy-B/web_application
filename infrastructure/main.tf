provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "./modules/vpc"
  availability_zones = var.availability_zones
}

module "security_groups" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "rds" {
  source            = "./modules/rds"
  vpc_id            = module.vpc.vpc_id
  db_subnet_group   = module.vpc.db_subnet_group
  security_group_id = module.security_groups.rds_sg_id
  db_username       = var.db_username
  db_password       = var.db_password
}

module "lambda" {
  source             = "./modules/lambda"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  security_group_id  = module.security_groups.lambda_sg_id
  iam_role           = module.iam.lambda_role_arn
}

module "amplify" {
  source         = "./modules/amplify"
  # amplify_app_id = var.amplify_app_id
  amplify_branch = var.amplify_branch
}

module "codepipeline" {
  source                 = "./modules/codepipeline"
  github_repository      = var.github_repository
  github_branch          = var.github_branch
  amplify_app_id         = var.amplify_app_id
  amplify_branch         = var.amplify_branch
  lambda_function_name   = module.lambda.lambda_function_name
  codebuild_project_name = var.codebuild_project_name
  codepipeline_bucket_name = var.codepipeline_bucket_name
  codepipeline_role_arn  = var.codepipeline_role_arn
  github_connection_arn  = var.github_connection_arn
}

module "cloudwatch" {
  source                 = "./modules/cloudwatch"
  lambda_function_name   = module.lambda.lambda_function_name
  db_instance_identifier = module.rds.db_instance_identifier
  alarm_action_arn       = var.alarm_action_arn
}
