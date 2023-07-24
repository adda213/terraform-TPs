provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["/home/vagrant/.aws/config"]
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]

}

terraform {
  backend "s3" {
   
    bucket = "terraform-backend-adda213"
    key    = "adda-prod.tfstate"
    region = "us-east-1"
    shared_credentials_file = "/home/vagrant/.aws/credentials"
  }
}

module "EC2" {
    source = "../modules/EC2"
    instancetype = "t2.micro"
aws_common_tag = {
  Name : "ec2-prod-adda213"
}
sg_name = "security-group-prod-adda"
}