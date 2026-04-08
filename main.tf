terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"

}

resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    
    tags     = {
        Name = "project1-vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id                   = aws_vpc.main_vpc.id
    cidr_block               = "10.0.1.0/24"
    map_public_ip_on_launch  = true

    tags = {
        Name = "project1-public-subnet"
    }



}

resource "aws_internet_gateway" "nameigw" {
    vpc_id = aws_vpc.main_vpc.id

    tags = {
        Name ="project1-igw"
    }
  
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
         gateway_id = aws_internet_gateway.nameigw.id
}
    tags = {
        Name = "project1-public-rt"
    }
  
}

resource "aws_route_table_association" "public_assoc" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow web and SSH traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project1-allow-web"
  }
}

resource "aws_instance" "web_server" {
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_web.id]
  associate_public_ip_address = true


    user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello from Terraform" > /var/www/html/index.html
EOF 
    tags ={
        Name = "project1-web-sever"
    }
}

  
  