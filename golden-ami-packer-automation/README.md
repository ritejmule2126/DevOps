📦 Golden AMI Creation Using Packer | Automated NGINX Setup

This repository contains the configuration files and steps to create a Golden AMI using HashiCorp Packer.
The AMI is built on an Ubuntu base image and automatically installs & configures Nginx to serve a static webpage.

🚀 Project Overview

A Golden AMI is a secure, reusable, and pre-configured machine image that contains all software, dependencies, and configurations.
This project uses Packer to automate AMI creation to ensure:

✔ Consistency

✔ Repeatability

✔ Faster EC2 provisioning

✔ Infrastructure-as-Code (IaC) best practices

The output AMI comes with Nginx installed and a pre-configured welcome page.

🛠️ Tools & Technologies
Tool / Service	Purpose
Packer	Automates AMI creation
AWS EC2 (Amazon EBS AMI)	Base image & AMI storage
Ubuntu AMI	Source operating system
Shell Provisioner	Installs and configures Nginx
📂 File Structure
├── goldenimage.pkr.hcl      # Main Packer template
├── README.md                # Project documentation

⚙️ Packer Template Breakdown (goldenimage.pkr.hcl)
1️⃣ Required Plugins
packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

2️⃣ Source AMI Block (amazon-ebs builder)
source "amazon-ebs" "golden-ami" {
  ami_name        = "golden-ami-{{timestamp}}"
  instance_type   = "t3.micro"
  region          = "ap-south-1"
  source_ami      = "ami-02b8269d5e85954ef"
  ssh_username    = "ubuntu"
  ami_description = "An Ubuntu Linux 2 AMI with Nginx installed and configured to serve a static website."
}

3️⃣ Provisioner (Nginx Setup + Webpage Deployment)
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

🧪 Steps to Build the Golden AMI
1️⃣ Install Packer

Download Packer:
https://developer.hashicorp.com/packer/install

Check installation:

packer --version

2️⃣ Initialize Plugins
packer init goldenimage.pkr.hcl

3️⃣ Validate the Template
packer validate goldenimage.pkr.hcl

4️⃣ Build the AMI
packer build goldenimage.pkr.hcl

✔ What This Build Does

Launches a temporary EC2 instance

Installs & configures Nginx

Deploys a custom static webpage

Creates & registers a Golden AMI

Terminates the temporary instance

🎯 Output
Output Item	Description
AMI Name	golden-ami-<timestamp>
Web Server	Nginx installed & running
Webpage	Located at /var/www/html/index.html
AMI Usability	Can be used to launch EC2 instances immediately
📌 Why Golden AMIs?

Golden AMIs help teams:

Reduce provisioning time

Ensure consistent server environments

Improve security with baked-in patches

Simplify deployment in Auto Scaling Groups

📸 Sample Screenshot (optional)

Add screenshots of Packer build output or AWS AMI console here.

🤝 Contributing

Contributions are welcome!
Feel free to fork the repo and submit pull requests.

📄 License

This project is licensed under the MIT License.
