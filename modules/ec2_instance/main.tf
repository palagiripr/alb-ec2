resource "aws_instance" "myinstance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group_id]

  # Other EC2 instance configurations...

  tags = {
    Name = "example-${count.index}"
  }
}
