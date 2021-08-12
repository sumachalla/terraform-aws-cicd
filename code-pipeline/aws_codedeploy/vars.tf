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

variable "buildspec_destroy_file" {
    type = string
}

variable "github_repository" {
    type = string
}
variable "buildspec_plan_file" {
    type = string
}
variable "buildspec_apply_file" {
    type = string
}