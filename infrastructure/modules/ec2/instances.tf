resource "aws_key_pair" "default" {
    key_name = "terraform-ec2"
    public_key = "${file("${var.key_path}")}"   

}

#creating ec2 instances
resource "aws_instance" "web" {
    count = "${var.instance_count}"
    ami = "${var.ami}"
    instance_type = "${var.ec2_instance_type}"
    vpc_security_group_ids = ["${var.security_group_id}"]
    subnet_id = element (var.public_subnets, count.index)
    key_name = "${aws_key_pair.default.key_name}"
    user_data = "${file("user-data/install_httpd.sh")}"
    
    
    tags =  {
        Name = "Ec2 Terraform ${var.environment} ${var.product}-${count.index}"
    }
}

