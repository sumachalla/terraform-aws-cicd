resource "aws_iam_role" "code_pipeline_role" {
    name = "terraform-codepipeline-role"
    # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform-role = "codepipeline"
  }
}

resource "aws_iam_role" "code_codebuild_role" {
    name = "terraform-codebuild-role"
    # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform-role = "codepipeline"
  }
}

data "aws_iam_policy_document" "tf-cicd-pipeline-policies" {
    statement {
        sid =""
        actions = ["codestar-connections:UseConnection"]
        resources = ["*"]
        effect = "Allow"
    }
    statement {
        sid =""
        actions = ["cloudwatch:*", "s3:*", "codebuild:*", "codepipeline:*", "ec2:Describe*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "tf-cicd-pipeline-policy" {
    name = "tf-cicd-pipeline-policy"
    path = "/"
    policy = "${data.aws_iam_policy_document.tf-cicd-pipeline-policies.json}"

}

resource "aws_iam_role_policy_attachment" "tf-cicd-pipeline-policy-attachement" {
    policy_arn = "${aws_iam_policy.tf-cicd-pipeline-policy.arn}"
    role = "${aws_iam_role.code_pipeline_role.id}"
}


data "aws_iam_policy_document" "tf-cicd-codebuild-policies" {
    statement {
        sid =""
        actions = ["cloudwatch:*","logs:*", "s3:*", 
        "codebuild:*", "secretsmanager:*", "iam:*", 
        "codepipeline:*", "ec2:Describe*", "ec2:CreateVpc", 
        "ec2:*", 
        "elasticloadbalancing:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "tf-cicd-codebuild-policy" {
    name = "tf-cicd-codebuild-policy"
    path = "/"
    policy = "${data.aws_iam_policy_document.tf-cicd-codebuild-policies.json}"

}

resource "aws_iam_role_policy_attachment" "tf-cicd-codebuild-policy-attachement" {
    policy_arn = "${aws_iam_policy.tf-cicd-codebuild-policy.arn}"
    role = "${aws_iam_role.code_codebuild_role.id}"
}