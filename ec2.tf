// key pair(login)
resource "aws_key_pair" "my_key" {

  key_name   = "keyPairEC2-newsss-3344"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK9xLBeET0S4l+0bQy7Zb2jIvnaMIrVoxV00B2xnlac3 user@DESKTOP-DGQ68PF"

}

//VPC and Security group

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "mySecurityGroup" {

  name        = "mySecurityGroup-kunj-3344"
  description = "This is my security group"
  vpc_id      = data.aws_vpc.default.id
  tags = {
    Name = "allow_tls"
  }

  # Inbount rules

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }

  # Outbound rules

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

}

# Ec2 instance
resource "aws_instance" "my_instance" {
  key_name        = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.mySecurityGroup.id]
  instance_type   = var.ec2_instance_type
  ami             = var.ec2_ami_id

  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }

  tags = {
    Name = "My first terraform EC2 instance"
  }

}
