provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["/home/vagrant/.aws/config"]
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]

}

resource "aws_instance" "myEC2" {
  ami           = "ami-04823729c75214919"
  instance_type = "t2.micro"
  key_name      = "adda-devops"
  tags = {
    Name = "EC2-adda"
  }
}