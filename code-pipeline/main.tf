provider "aws" {
    region= "${var.region}"
}

module "pipeline_codebuild" {
  source = "./aws_codedeploy" 
  dockerhub_credentials = "${var.dockerhub_credentials}"
  codestar_connector_credentials = "${var.codestar_connector_credentials}"
  pipeline_bucket_name = "${var.pipeline_bucket_name}"
}


