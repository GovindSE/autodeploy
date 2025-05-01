provider "aws" {
    region = var.aws-region
  
}
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "4.0.2"
   name = "autodeploy-vpc"
   cidr = "10.0.0.0/16"
   azs= ["${var.aws-region}a","${var.aws-region}b"]
   public_subnets = ["10.0.1.0/24","10.0.2.0/24"]

   enable_nat_gateway = true
   single_nat_gateway = true
   enable_dns_hostnames = true
   enable_dns_support = true

   tags = {
    Name="auto-deploc-vpc"
   }
}