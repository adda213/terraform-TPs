output "aws_instance_id" {
    value = aws_instance.myEC2.id
}
output "aws_instance_availability_zone" {
    value = aws_instance.myEC2.availability_zone
}