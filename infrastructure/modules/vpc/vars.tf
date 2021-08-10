variable "vpc_cidr" {
    type = string
    description = "Default VPC CIDR block"    
}
variable "public_subnet_cidr" {
    type = list
    description = "List of"
}
variable "private_subnet_cidr" {
    type = list
    description = "List of"
}

variable "azs" {
    type = list
    description = "" 
} 
 
