# AWS Terraform Project 2 - Web Server with Private Database

## Overview
This project provisions a multi-tier AWS architecture using Terraform. It includes a public-facing web server and a private database deployed in isolated subnets.

The goal of this project is to demonstrate real-world cloud architecture, network segmentation, and secure infrastructure design.

---

## Architecture

### Public Tier
- EC2 Instance running Apache Web Server
- Public Subnet
- Internet Gateway
- Route Table with internet access

### Private Tier
- RDS MySQL Database
- Two Private Subnets (Multi-AZ)
- Database Subnet Group

---

## Networking
- Custom VPC
- Public subnet for web server
- Two private subnets for database (different availability zones)
- Internet Gateway attached to VPC
- Route table configured for internet access

---

## Security
- Web Security Group:
  - Allows HTTP (port 80) from anywhere
  - Allows SSH (port 22) from anywhere

- Database Security Group:
  - Allows MySQL (port 3306) only from the web server security group
  - No public access

---

## Technologies Used
- Terraform
- AWS EC2
- AWS VPC
- AWS RDS (MySQL)
- Linux (Amazon Linux)
- Git and GitHub

---

## Features
- Multi-tier architecture (web and database separation)
- Public and private subnet isolation
- Multi-AZ database deployment
- Infrastructure as Code using Terraform
- Automated web server setup using user_data

---

## Result
- Web server accessible via public IP
- Apache installed and serving a test page
- RDS database deployed in private subnets
- Secure communication between web and database layers

---

## How to Run

terraform init  
terraform plan  
terraform apply  

To destroy resources:

terraform destroy  

---

## Key Learnings
- Designing multi-tier cloud architecture
- Implementing secure network segmentation
- Configuring AWS resources using Terraform
- Understanding RDS subnet requirements (multi-AZ)
- Debugging infrastructure deployment issues

---

## Future Improvements
- Add Application Load Balancer
- Implement Auto Scaling Group
- Use S3 backend for Terraform state
- Add CI/CD pipeline (GitHub Actions or Jenkins)
- Modularize Terraform configuration

---

## Author
Emile Tangunyi