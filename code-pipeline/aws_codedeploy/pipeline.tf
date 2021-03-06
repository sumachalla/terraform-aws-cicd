resource "aws_codebuild_project" "tf-plan" {
    name = "tf-cicd-plan"
    service_role = "${aws_iam_role.code_codebuild_role.arn}"
    depends_on = [
      aws_iam_role.code_codebuild_role
    ]   

    artifacts {
        type = "CODEPIPELINE"
    }

    environment {
        compute_type = "BUILD_GENERAL1_SMALL"
        image = "hashicorp/terraform:1.0.0"
        type = "LINUX_CONTAINER"
        image_pull_credentials_type = "SERVICE_ROLE"
        registry_credential {
            credential = "${var.dockerhub_credentials}"
            credential_provider = "SECRETS_MANAGER"
        }
    }
    source {
        type = "CODEPIPELINE"
        buildspec = "${file("${var.buildspec_plan_file}")}"
    }
}

resource "aws_codebuild_project" "tf-apply" {
    name = "tf-cicd-apply"
    description = "Apply terraform plan"
    service_role = "${aws_iam_role.code_codebuild_role.arn}"

    artifacts {
        type = "CODEPIPELINE"
    }

    environment {
        compute_type = "BUILD_GENERAL1_SMALL"
        image = "hashicorp/terraform:1.0.0"
        type = "LINUX_CONTAINER"
        image_pull_credentials_type = "SERVICE_ROLE"
        registry_credential {
            credential = "${var.dockerhub_credentials}"
            credential_provider = "SECRETS_MANAGER"
        }
    }
    source {
        type = "CODEPIPELINE"
        buildspec = "${file("${var.buildspec_apply_file}")}"
    }
}


resource "aws_codebuild_project" "tf-destroy" {
    name = "tf-cicd-destroy"
    description = "Destroy terraform resources"
    service_role = "${aws_iam_role.code_codebuild_role.arn}"

    artifacts {
        type = "CODEPIPELINE"
    }

    environment {
        compute_type = "BUILD_GENERAL1_SMALL"
        image = "hashicorp/terraform:1.0.0"
        type = "LINUX_CONTAINER"
        image_pull_credentials_type = "SERVICE_ROLE"
        registry_credential {
            credential = "${var.dockerhub_credentials}"
            credential_provider = "SECRETS_MANAGER"
        }
    }
    source {
        type = "CODEPIPELINE"
        buildspec = "${file(var.buildspec_destroy_file)}"
    }
}

   
resource "aws_codepipeline" "cicd_pipeline" {

    name   = "tf-cicd-pipeline"
  role_arn = "${aws_iam_role.code_pipeline_role.arn}"

  artifact_store {
    location = "${aws_s3_bucket.pipeline-bucket-artifact.id}"
    type     = "S3"


  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["tf-code"]

      configuration = {
        ConnectionArn    = "${var.codestar_connector_credentials}"
        FullRepositoryId = "sumachalla/github-aws-cicd"
        BranchName       = "main"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
        name ="Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["tf-code"]
            configuration = {
                ProjectName = "tf-cicd-plan"
            }
        }
    }

    stage {
        name ="Deploy"
        action{
            name = "Deploy"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["tf-code"]
            configuration = {
                ProjectName = "tf-cicd-apply"
            }
        }
    }

    stage {
        name ="Approval"
        action{
            name = "Approval"
            category = "Approval"
            provider = "Manual"
            version = "1"
            owner = "AWS"
            input_artifacts = []
            configuration = {
                
            }
        }
    }

 stage {
        name ="Destroy"
        action{
            name = "Destroy"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["tf-code"]
            configuration = {
                ProjectName = "tf-cicd-destroy"
            }
        }
    }
}