# Terraform_AWS_Project
## Project Summary
This Terraform project creates 2 region infrastructure in AWS with modules for managing various components including EC2 instances, DynamoDB tables, VPC_endpoints, S3 buckets,Security groups and networking resources. The infrastructure is deployed in two different AWS regions with identical configurations for reusability and availbility.

## Modules

### Network

The Network module is responsible for creating the VPC, subnets, route tables, Nat gateway, internet gateway, and network ACLs in each region.

### EC2 Instance

The EC2 Instance module provisions EC2 instances with the specified AMI, instance type, and other configurations. It deploys instances into the subnets created by the Network module.

### DynamoDB Table

The DynamoDB Table module creates DynamoDB tables with the specified attributes and settings. It ensures identical tables are created in both regions.

### VPC Endpoint

The VPC Endpoint module sets up VPC endpoint for S3 services to enable private connectivity within the VPC.

### S3 Bucket

The S3 Bucket module creates S3 buckets with the specified configuration, including bucket policies, versioning, and encryption settings. It ensures identical buckets are created in both regions.

### Security Group

The Security Group module defines security groups with specified ingress and egress rules to control traffic to and from EC2 instances. It ensures consistent security settings across regions.

## App1

The App1 directory contains the configuration files for deploying the infrastructure related to the first application.

### Directory Structure

- `main.tf`: Orchestrates the usage of different modules and defines outputs specific to App1.
- `variables.tf`: Contains input variables used to customize the configuration for App1.
- `terraform.tfvars`: Contains variable assignments for specific environment settings (e.g., region, instance type) for App1.
- `backend.tf`: Configures the Terraform backend for App1.
- `provider.tf`: Specifies the provider configuration for App1.

## App2

The App2 directory contains the configuration files for deploying the infrastructure related to the second application.

### Directory Structure

- `main.tf`: Orchestrates the usage of different modules and defines outputs specific to App2.
- `variables.tf`: Contains input variables used to customize the configuration for App2.
- `terraform.tfvars`: Contains variable assignments for specific environment settings (e.g., region, instance type) for App2.
- `backend.tf`: Configures the Terraform backend for App2.
- `provider.tf`: Specifies the provider configuration for App2.

- ![Screenshot 2024-03-12 234326](https://github.com/saranourmahmoudal-tantawy/Terraform_AWS_Project/assets/161065103/5b6d5db6-6221-4f8c-b873-ad49c5b5420f)


