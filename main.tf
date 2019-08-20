provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "scalr" {
  count = 1
  ami                    = "ami-2757f631"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-6b709a55"
  vpc_security_group_ids = ["sg-05688b070715b257f"]
  key_name               = "rf-tf"
}
output "instance_public_ips" {
  value = "${aws_instance.scalr.*.id}"
}
