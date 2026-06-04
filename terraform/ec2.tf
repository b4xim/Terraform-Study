resource "aws_instance" "tf_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "terraform"
  vpc_security_group_ids      = [aws_security_group.tf_security_group.id]
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "Terraform EC2 Instance"
  }
  root_block_device {
    volume_size = 10
  }
}


resource "aws_security_group" "tf_security_group" {
  name        = "tf_security_group"
  description = "Security group for Terraform EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
output "instance_public_command" {
  value = "ssh -i ~/.ssh/terraform.pem ubuntu@${aws_instance.tf_ec2_instance.public_ip}"
}
