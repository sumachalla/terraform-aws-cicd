variable  "pipeline_bucket_name" {
    type = string
}


variable  "dockerhub_credentials" {
    type = string
}

variable "codestar_connector_credentials" {
    type = string
}
variable "region" {
    default = "eu-west-2"
}