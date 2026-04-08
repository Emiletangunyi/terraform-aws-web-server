# AWS Terraform Project 1 - Web Server

## 📌 Overview
This project provisions a complete AWS infrastructure using Terraform and deploys a publicly accessible web server.

It demonstrates Infrastructure as Code (IaC) by automating the creation of networking, security, and compute resources.

---

## 🏗️ Architecture
The following components were created:

- VPC (Virtual Private Cloud)
- Public Subnet
- Internet Gateway
- Route Table + Association
- Security Group (ports 22, 80, 443)
- EC2 Instance (t2.micro)
- Apache Web Server (installed via user_data)

---

## ⚙️ Technologies Used
- Terraform
- AWS (EC2, VPC, Networking)
- Linux (Amazon Linux)
- Git & GitHub

---

## 🚀 Features
- Fully automated infrastructure deployment
- Public web server accessible via browser
- Secure access via Security Groups
- Infrastructure lifecycle management using Terraform

---

## 🧪 Result
After deployment, the EC2 instance serves a web page:

Hello from Terraform

Accessible via the instance's public IP.

---

## ▶️ How to Run

### 1. Initialize Terraform
terraform init

### 2. Preview Infrastructure
terraform plan

### 3. Deploy Infrastructure
terraform apply

### 4. Destroy Infrastructure
terraform destroy

---

## 🧠 Key Learnings
- AWS networking fundamentals (VPC, subnets, routing)
- Infrastructure as Code using Terraform
- Automating server configuration with user_data
- Managing cloud resources efficiently and securely

---

## 🔮 Future Improvements
- Add Application Load Balancer (ALB)
- Implement Auto Scaling Group
- Use S3 backend for Terraform state
- Modularize Terraform code

---

## 👤 Author
Emile Tangunyi