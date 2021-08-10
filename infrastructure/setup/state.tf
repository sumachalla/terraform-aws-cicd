terraform {
    backend "s3" {
        bucket = "myfirstbucket-suma"
        encrypt = true
        key = "terraform.tfstate"
        region = "eu-west-2"
    }
}