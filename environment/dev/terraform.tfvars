aws_region = "us-east-1"
environment = "dev"
project = "fonka"
vpc = {
  name                   = "dev_vpc"
  azs                    = ["us-east-1a", "us-east-1b"]
  cidr                   = "10.0.0.0/24"
  private_subnets        = ["10.0.0.0/26", "10.0.0.64/26"]
  private_subnet_names   = ["eks", "eks"]
  public_subnets         = ["10.0.0.128/26", "10.0.0.192/26"]
  public_subnet_names   = ["eks", "eks"]
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}