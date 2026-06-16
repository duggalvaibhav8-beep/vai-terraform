variable "ec2_instance_type"{
    default = "t3.micro"
    type = string
}

variable "ec2_root_storage" {
    default = "30"
    type = number
}

variable "ec2_ami_id" {
    default = "ami-07a00cf47dbbc844c"
    type = string
  
}