
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myEC2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  key_name        = "adda-devops"
  tags            = var.aws_common_tag
  security_groups = ["${var.sg_group}"]
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx" 
    ]
    }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./adda-devops.pem")
    host     = self.public_ip
  }
}

