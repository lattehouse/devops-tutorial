terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = "us-east-2"  
}

# Create an EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0efc43a4067fe9a3e"  # Amazon Linux 2023 AMI (us-west-2)
  instance_type = "t2.micro"               # Free-tier eligible instance

  tags = {
    Name = "Terraform-Codespaces-Example"
  }
}

# Output the instance public IP (optional)
output "public_ip" {
  value = aws_instance.example.public_ip
}