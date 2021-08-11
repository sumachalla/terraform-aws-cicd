terraform {
    backend "s3" {
        bucket = "myfirstbucket-suma"
        encrypt = true
        key = "codepipeline-terraform.tfstate"
        region = "eu-west-2"
    }
}