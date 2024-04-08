provider "aws" {
  region = var.aws_region
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  subnet_ids        = var.subnet_ids
  security_group_id = var.security_group_id
}

module "ec2_instances" {
  source              = "./modules/ec2_instance"
  instance_count      = 2
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_ids          = var.subnet_ids
  security_group_id   = var.security_group_id
  
}
