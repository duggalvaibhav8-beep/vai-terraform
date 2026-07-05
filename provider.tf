provider "aws" {
  region = "ap-south-1"
}

terraform {
required_providers {
aws = {
souce = "hashicrop/aws"
version = "~ 6.0"
}
}
}
