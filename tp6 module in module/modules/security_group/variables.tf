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
variable "sg_name" {
  type        = string
  description = "set security group name"
  default     = "security-group-adda"
}