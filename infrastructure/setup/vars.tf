variable "region" {
    default = "eu-west-2"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"    
}
variable "public_subnet_cidr" {
    type = list
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]    
}

variable "private_subnet_cidr" {
    type = list
    default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]    
}
/* variable "azs" {
    type = list
    default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"] 
} */

data "aws_availability_zones" "azs" {}

  
variable "ami" {
    default = "ami-0ad8ecac8af5fc52b"
  
}
variable "ec2_instance_type" {
    default = "t2.micro"
}
variable "instance_count" {
    type = number
    default = 3
}
variable "environment" {
    description = "Environment"
    default = "dev"
}
variable "codestar_connector_credentials" {
    type = string
}

variable "product" {
    default =  "camunda"  
}

variable "key_path" {
    description = "Key file"
    default = "terraform-ec2.pub"
}
  
variable  "pipeline_bucket_name" {
    type = string
}

variable  "dockerhub_credentials" {
    type = string
}