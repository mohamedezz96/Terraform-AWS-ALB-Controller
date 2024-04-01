# Terraform AWS ALB Controller

This repository contains Terraform code for deploying an AWS Application Load Balancer (ALB) controller.

## Getting Started

To get started, follow these instructions:

### Prerequisites

- Terraform installed on your local machine. You can download it from [here](https://www.terraform.io/downloads.html).
- An AWS account with appropriate permissions to create resources.
- Set the following Terraform variables as environment variables on your machine:

    ```bash
    export TF_VAR_cluster_ca_cert="EKS-CA"
    export TF_VAR_cluster_endpoint="EKS-Endpoint"
    ```

    Replace `EKS-CA` with the actual cluster's CA certificate, and `EKS-Endpoint` with the actual endpoint of your EKS cluster.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/mohamedezz96/Terraform-AWS-ALB-Controller.git
    ```
2. Change into the project directory:

    ```bash
    cd Terraform-AWS-ALB-Controller
    ```
