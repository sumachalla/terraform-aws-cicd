variable "region" {
    
}
variable "vpc_cidr" {
}
variable "public_subnet_cidr" {
    type = list    
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

variable "product" {
    default =  "SimpleWeb"  
}

variable "key_path" {
    description = "Key file"
    default = "terraform-ec2.pub"
}
  
