provider "aws" {
    region= "${var.region}"
}

module "pipeline_codebuild" {
  source = "./aws_codedeploy" 
  dockerhub_credentials = "${var.dockerhub_credentials}"
  codestar_connector_credentials = "${var.codestar_connector_credentials}"
  pipeline_bucket_name = "${var.pipeline_bucket_name}"
  buildspec_plan_file = "${var.buildspec_plan_file}"
  buildspec_destroy_file = "${var.buildspec_destroy_file}"
  buildspec_apply_file = "${var.buildspec_apply_file}"
  github_repository = "${var.github_repository}"
}


