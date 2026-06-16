output "ec2_instance_public_ip" {
 value = aws_instance.my_instance.public_ip  
}