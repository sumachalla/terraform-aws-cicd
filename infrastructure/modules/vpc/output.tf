output "main_vpcid" {
    value = "${aws_vpc.main.id}"
}

output "vpc_public_subnets" {
    value = "${aws_subnet.publicsubnets.*.id}"    
}
output "security_group_id" {
    value = "${aws_security_group.TerraformEc2_sg_pub.id}"
} 