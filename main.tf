terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-087c17d1fe0178315"
  instance_type          = "t2.micro"
  key_name               = "Test"
  monitoring             = true
  vpc_security_group_ids = ["sg-0a1a3a4a"]
  subnet_id              = "subnet-1138155b"
  user_data              = var.user_data
  iam_instance_profile   = "ansible_s3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}