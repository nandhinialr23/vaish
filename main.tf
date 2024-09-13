terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "t1"

  instance_type          = "t3.micro"
  key_name               = "mykey"
  monitoring             = true
  vpc_security_group_ids = ["sg-04165dec37a117b3d"]
  subnet_id              = "subnet-0aa5c2bceb3f1fd80"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
