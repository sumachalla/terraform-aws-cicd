variable "environment" {
    description = "Environment"
}

variable "product" {
    description = "Web applocation"
  
}

variable "key_path" {
    description = "Key file"
  
}
variable "public_subnets" {
    type = list    
}
variable "ami" {
    default = "ami-0d26eb3972b7f8c96"
  
}
variable "ec2_instance_type" {
    
}
variable "instance_count" {
    type = number
}
variable "security_group_id" {
    type = string    
}

variable "azs" {
    type = list    
}