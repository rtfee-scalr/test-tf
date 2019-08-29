provider "aws" {
  access_key = var.scalr_aws_access_key
  secret_key = var.scalr_aws_secret_key
  region     = var.region
}

resource "aws_instance" "scalr" {
  count = 1
  ami                    = "ami-2757f631"
  instance_type          = "t2.nano"
  subnet_id              = "subnet-0ebb1058ad727cfdb"
  vpc_security_group_ids = ["sg-0880cfdc546b123ba"]
  key_name               = "ryan"
}

output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.scalr.*.id
}

output "public_ip" {
  description = "Public IP"
  value       = aws_instance.scalr.*.public_ip
}

output "private_ip" {
  description = "Private IP"
  value       = aws_instance.scalr.*.private_ip
}
