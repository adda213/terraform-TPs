provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["/home/vagrant/.aws/config"]
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]

}

terraform {
  backend "s3" {
   
    bucket = "terraform-backend-adda213"
    key    = "adda-dev.tfstate"
    region = "us-east-1"
    shared_credentials_file = "/home/vagrant/.aws/credentials"
  }
}

module "security_group" {
    source = "../modules/security_group"
    sg_name = "security-group-dev-adda"
}
module "EC2" {
    source = "../modules/EC2"
    instancetype = "t2.nano"
aws_common_tag = {
  Name : "ec2-dev-adda213"
}

sg_group = module.security_group.sg_name
}
module "ELB" {
    source = "../modules/IP_publique"
    aws_instance_id = module.EC2.aws_instance_id
    aws_instance_availability_zone = module.EC2.aws_instance_availability_zone
}