variable "instancetype" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    name = "ec2-adda"
  }
}
variable "aws_instance_id" {}
variable "aws_instance_availability_zone" {}