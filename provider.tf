provider "aws" {
  region = "ap-south-1"
}

terraform {
required_providers {
aws = {
source = "hashicrop/aws"
version = "~ 6.0"
}
}
}
