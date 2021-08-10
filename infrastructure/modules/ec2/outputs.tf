output "elb-dns" {
    value = "${aws_elb.ec2-elb.dns_name}"
}

output "public-ips" {
    value = "${aws_instance.web.*.public_ip}"
}
