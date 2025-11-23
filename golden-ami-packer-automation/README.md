# 📦 Golden AMI Creation Using Packer | Automated NGINX Setup

This repository contains the configuration files and steps to create a **Golden AMI** using **HashiCorp Packer** on AWS.  
The AMI is built on top of an **Ubuntu** base image and automatically installs and configures **Nginx** to serve a static web page.

---

## 🚀 Project Overview

A **Golden AMI** is a pre-configured, secure, and reusable machine image that contains all required software, dependencies, and configurations needed for an application or workload.  
Using **Packer**, this project automates AMI creation to ensure:

- Consistency
- Repeatability
- Faster EC2 provisioning
- Infrastructure-as-code (IaC) best practices

The output AMI comes with **Nginx preinstalled** and a **custom welcome page** already deployed.

---

## 🛠️ Tools & Technologies

| Tool / Service                 | Purpose                             |
|--------------------------------|-------------------------------------|
| Packer                         | Automates image (AMI) creation      |
| AWS EC2 (Amazon EBS-based AMI) | Base image and final AMI storage    |
| Ubuntu AMI                     | Source operating system             |
| Shell Provisioner              | Installs and configures Nginx       |

---

## 📂 File Structure

├── goldenimage.pkr.hcl # Main Packer template
└── README.md # Documentation

---

## ⚙️ Packer Template Breakdown (`goldenimage.pkr.hcl`)

### 1️⃣ Required Plugins

packer {
required_plugins {
amazon = {
version = ">= 1.0.0"
source = "github.com/hashicorp/amazon"
}
}
}

This section tells Packer to use the **Amazon** plugin for building AMIs on AWS.

---

### 2️⃣ Source AMI Block (amazon-ebs Builder)

source "amazon-ebs" "golden-ami" {
ami_name = "golden-ami-{{timestamp}}"
instance_type = "t3.micro"
region = "ap-south-1"
source_ami = "ami-02b8269d5e85954ef"
ssh_username = "ubuntu"
ami_description = "An Ubuntu Linux 2 AMI with Nginx installed and configured to serve a static website."
}

Key points:

- `ami_name`: AMI name with a timestamp suffix for uniqueness  
- `instance_type`: Uses a cost-effective `t3.micro` instance during build  
- `region`: AWS region (`ap-south-1`)  
- `source_ami`: Ubuntu base AMI ID  
- `ssh_username`: Default SSH user (`ubuntu`)  
- `ami_description`: Description visible in the AWS console  

---

### 3️⃣ Provisioner (Nginx Setup + Webpage Deployment)

build {
sources = [
"source.amazon-ebs.golden-ami"
]

provisioner "shell" {
inline = [
"sudo apt update -y",
"sudo apt install nginx -y",
"sudo systemctl enable nginx",
"sudo rm /var/www/html/*.html",
"echo '<html><body><h1>Welcome to the Golden AMI Website! powered by DIM Nov team </h1></body></html>' | sudo tee /var/www/html/index.html",
"sudo systemctl start nginx"
]
}
}

This build block:

- Updates package repositories  
- Installs **Nginx**  
- Enables Nginx at boot  
- Removes default HTML files  
- Writes a **custom `index.html`** welcome page  
- Starts the Nginx service  

---

## 🧪 Steps to Build the Golden AMI

### 1. Install Packer

Download and install Packer from the official site:

- https://developer.hashicorp.com/packer/install

Verify installation:

packer --version


---

### 2. Initialize Packer Plugins

From the project directory:

packer init goldenimage.pkr.hcl


---

### 3. Validate the Template

packer validate goldenimage.pkr.hcl


This checks the syntax and configuration of your Packer template.

---

### 4. Build the AMI

packer build goldenimage.pkr.hcl



This will:

- Start a temporary **EC2 instance**
- Install and configure **Nginx**
- Deploy the static web page
- Create and register a **Golden AMI**
- Terminate the temporary instance after the build

---

## 🎯 Output

After a successful build, you will get:

- A new AMI with a name like:  
  `golden-ami-1732345678`
- **Nginx** installed, enabled, and running
- Custom web page available at:  
  `/var/www/html/index.html`

You can now launch EC2 instances directly from this AMI and have Nginx + the welcome page ready out of the box.

---

## 📌 Why Golden AMIs?

Golden AMIs help teams:

- Reduce provisioning time  
- Ensure consistent, reproducible environments  
- Improve security by baking updates and baseline configs into the image  
- Simplify deployments in Auto Scaling Groups and other scaling solutions  

---

## 📸 Sample Screenshot (Optional)

You can enhance this README by adding:

- Screenshot of the Packer build output  
- Screenshot of the AMI in the AWS EC2 console  
- Screenshot of the Nginx welcome page in a browser  

Example (after adding images to your repo):

![Packer Build Output](images(



---

## 🤝 Contributing

Contributions are welcome!

- Fork the repository  
- Create a feature branch  
- Commit your changes  
- Open a Pull Request describing your improvements  

---

## 📄 License

This project is licensed under the **MIT License**.  
See the `LICENSE` file for full details.

