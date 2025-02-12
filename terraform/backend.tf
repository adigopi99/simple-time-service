
terraform {
  backend "s3" {
    bucket = "infraSetup"
    key    = "/home/ec2-user"
    region = "us-west-2"
    encrypt = true
  }
}

