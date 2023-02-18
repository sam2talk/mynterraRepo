resource "aws_vpc" "sonar" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "sonar_vpc"
  }
}


 resource "aws_security_group" "security_sonar_group_2022" {
      name        = "security_sonar_group_2022"
      description = "security group for Sonar"
      ingress {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     # outbound from Sonar server
      egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      tags= {
        Name = "security_sonar"
      }
    }


    resource "aws_instance" "mySonarInstance" {
      ami           = "ami-0557a15b87f6559cf"
      key_name = "mackey1"
      instance_type = "t2.micro"
      vpc_security_group_ids = [aws_security_group.security_sonar_group_2022.id]

      tags= {
        Name = "sonar_instance"
      }
    }

# Create Elastic IP address for Sonar instance
resource "aws_eip" "mySonarInstance" {
  vpc      = true
  instance = aws_instance.mySonarInstance.id
tags= {
    Name = "sonar_elastic_ip"
  }
}
