module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source = "./modules/subnet"
  region = var.region
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security_group"
  region = var.region
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source = "./modules/load_balancer"
  region = var.region
  vpc_id = module.vpc.vpc_id
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  region = var.region
  ami_id = module.ec2_instance.ami_id
 
