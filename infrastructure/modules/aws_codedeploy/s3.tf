resource "aws_s3_bucket" "pipeline-bucket-artifact" {
    bucket = "${var.pipeline_bucket_name}"
    acl = "private"
}