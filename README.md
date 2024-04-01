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
### Configuration
#### aws_alb_controller.tf
- `aws_alb_controller_version`: The version of the ALB controller Helm Chart to use.
- `cluster_name`: The name of your EKS cluster.
- `alb_policy_name`: The name of the IAM policy that will be created to be attached to the ALB controller.
- `alb_role_name`: The name of the IAM role that will be created for the ALB controller.
- `alb_sa_name`: The name of the Kubernetes serviceaccount that will be created for the ALB controller.
- `values_file`: The path to the YAML file containing additional configuration values for the ALB controller.

### Deployment

Once configured, you can deploy the ALB controller by running:

```bash
terraform init
terraform plan
terraform apply --auto-approve
```
### Usage
#### Example Ingress YAML

You can use the following YAML configuration for testing purposes:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
spec:
  rules:
    - http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: example-service
                port:
                  number: 80

`Warning` annotation "kubernetes.io/ingress.class" is deprecated, please use 'spec.ingressClassName' instead
