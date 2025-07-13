# Three-Tier Architecture Deployment on AWS with Terraform

A three-tier architecture consisting of a Web tier, Application tier, and a Database tier in private subnets with Auto Scaling for the web and application tier and a load balancer. A Bastion Host and NAT Gateway are provisioned to allow SSH access to the instances and access to the internet.

Terraform modules were used to make the process easily repeatable and reusable.
This deployment will create a scalable, secure, and highly available infrastructure that separates the different layers ensuring they all communicate with each other. The architecture includes an Amazon Virtual Private Cloud (VPC), Elastic Load Balancer (ELB), Auto Scaling Group (ASG), and a Relational Database (RDS).

* **Web Tier**: Includes a Bastion Host and NAT Gateway provisioned in public subnets. The Bastion Host serves as the access point to the infrastructure. The NAT Gateway allows the private subnets to connect to the internet while keeping instances' private IPs hidden from the public.
* **Application Tier**: Consists of an internet-facing load balancer directing traffic to a frontend Auto Scaling Group (ASG) in private subnets, along with a backend ASG. A script installs Apache in the frontend.
* **Database Tier**: Hosts a MySQL database in another set of private subnets, accessible by the backend (Node.js) application.

---

## Prerequisites

Ensure the following before you begin:

1. AWS account credentials (access key ID and secret access key).
2. Terraform installed: [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
3. Basic knowledge of AWS (EC2, VPC, ELB, ASG, RDS).
4. Basic knowledge of Terraform configuration files (`.tf`).

---

## Steps to Deploy

### 1. Clone the Repository

```bash
git clone https://github.com/Sanjith027/Secure-Scalable-3tier-AWS.git
cd Secure-Scalable-3tier-AWS
```

### 2. Configure AWS Credentials

```bash
aws configure
```

Provide your Access Key, Secret, and default region.

### 3. Create an S3 Bucket for Backend State (Optional)

Use the AWS Console or CLI to create a versioned S3 bucket for Terraform remote state.

### 4. Update Terraform Variables

* Open `terraform.tfvars`
* Modify values for:

  * `dbuser`
  * `dbpassword`
  * `db_name`

> 🔐 Don’t commit sensitive variables — use `.gitignore` to exclude `*.tfvars`

### 5. Initialize Terraform

```bash
cd terraform
terraform fmt
terraform init
```

### 6. Review & Validate

```bash
terraform plan
```

Ensure changes align with your expectations.

### 7. Apply Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

### 8. Access the Application

* Copy the output ELB DNS name.
* Paste it into your browser.
* You’ll see:

```text
3-Tier Architecture is Live from SANJITH
```

### 9. Destroy Infrastructure (Optional)

```bash
terraform destroy
```

Type `yes` to confirm.

---

## Project Structure

```
Secure-Scalable-3tier-AWS/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── modules/
│   │   ├── networking/
│   │   ├── compute/
│   │   ├── database/
│   │   └── loadbalancing/
│   └── user_data.sh
├── .gitignore
└── README.md
```

---

## Conclusion

Congratulations! You have successfully deployed a three-tier architecture on AWS using Terraform. This architecture provides a scalable and highly available infrastructure for your applications. Make sure to follow AWS best practices and security recommendations when deploying your production workloads.

