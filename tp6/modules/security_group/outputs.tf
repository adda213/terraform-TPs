output "sg_name" {
    description = "Name (id) of the bucket"
    value       = aws_security_group.allow_sssh_http_https.name