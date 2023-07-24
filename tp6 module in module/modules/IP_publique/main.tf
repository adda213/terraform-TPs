resource "aws_eip" "lb" {
  instance = var.aws_instance_id
  vpc      = true
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${aws_eip.lb.public_ip} , ID: ${var.aws_instance_id} , AZ: ${var.aws_instance_availability_zone} >> infos_ec2.txt"
  }
}
