resource "aws_instance" "scalr" {
  count = 1
  region = "${var.region}"
  ami                    = "ami-2757f631"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0ebb1058ad727cfdb"
  vpc_security_group_ids = ["sg-0880cfdc546b123ba"]
  key_name               = "ryan"
}

output "instance_public_ips" {
  value = "${aws_instance.scalr.*.id}"
}
