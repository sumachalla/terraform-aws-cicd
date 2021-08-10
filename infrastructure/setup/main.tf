provider "aws" {
    region= "${var.region}"
}
module "my_vpc" {
      source = "../modules/vpc"  
      vpc_cidr= "${var.vpc_cidr}"
      public_subnet_cidr= "${var.public_subnet_cidr}"
      private_subnet_cidr= "${var.private_subnet_cidr}"
      azs = "${data.aws_availability_zones.azs.names}"
     
}

module "my_ec2" {
    source = "../modules/ec2"  
    public_subnets = "${module.my_vpc.vpc_public_subnets}"
    environment = "${var.environment}"
    product = "${var.product}"
    ami = "${var.ami}"
    key_path = "${var.key_path}"
    azs = "${data.aws_availability_zones.azs.names}"
    instance_count = "${length(var.public_subnet_cidr)}"
    ec2_instance_type = "${var.ec2_instance_type}"
    security_group_id = "${module.my_vpc.security_group_id}"  
    depends_on = [
      module.my_vpc
    ]   
}

/*
module "pipeline_codebuild" {
  source = "../modules/aws_codedeploy" 
  dockerhub_credentials = "${var.dockerhub_credentials}"
  codestar_connector_credentials = "${var.codestar_connector_credentials}"
  pipeline_bucket_name = "${var.pipeline_bucket_name}"
}
*/

