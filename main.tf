module "vpc" {
  source          = "./modules/vpc"
  name            = var.vpc.name
  cidr            = var.vpc.cidr
  azs             = var.vpc.azs
  private_subnets = var.vpc.private_subnets
  private_subnet_names = [
    for i, subnet in var.vpc.private_subnet_names : "${subnet}-private-${element(var.vpc.azs, i % length(var.vpc.azs))}"
  ]
  public_subnets = var.vpc.public_subnets
  public_subnet_names = [
    for i, subnet in var.vpc.public_subnet_names : "${subnet}-public-${element(var.vpc.azs, i % length(var.vpc.azs))}"
  ]
  enable_nat_gateway     = var.vpc.enable_nat_gateway
  single_nat_gateway     = var.vpc.single_nat_gateway
  one_nat_gateway_per_az = var.vpc.one_nat_gateway_per_az
  tags = {
    Terraform   = "true"
    Environment = var.environment
    Project     = var.project
  }
}
