resource "aws_eip" "lb" {
  instance = aws_instance.myEC2.id
  vpc      = true
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${aws_eip.lb.public_ip} , ID: ${aws_instance.myEC2.id} , AZ: ${aws_instance.myEC2.availability_zone} >> infos_ec2.txt"
  }
}
