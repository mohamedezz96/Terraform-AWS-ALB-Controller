# Terraform AWS ALB Controller

This repository contains Terraform code for deploying an AWS Application Load Balancer (ALB) controller.

## Getting Started

To get started, follow these instructions:

### Prerequisites

- Terraform installed on your local machine. You can download it from [here](https://www.terraform.io/downloads.html).
- An AWS account with appropriate permissions to create resources.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/mohamedezz96/Terraform-AWS-ALB-Controller.git
    ```
2. Change into the project directory:

    ```bash
    cd Terraform-AWS-ALB-Controller
    ```
3. Configurations:
    #### aws_alb_controller.tf
    - `aws_alb_controller_version`: The version of the ALB controller Helm Chart to use.
    - `cluster_name`: The name of your EKS cluster.
    - `values_file`: The path to the YAML file containing additional configuration values for the ALB controller.

4. Install:

    Once configured, you can deploy the ALB controller by running:
    
    ```bash
    terraform init
    terraform plan
    terraform apply --auto-approve
    ```
### Usage
To Test your AWS-ALB-Controller you can follow this link: https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html

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
```

`Warning` annotation "kubernetes.io/ingress.class" is deprecated, please use 'spec.ingressClassName' instead

so:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
spec:
  ingressClassName: alb
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
```

**Note:** You can further configure the behavior of the AWS ALB controller by using annotations. Refer to the [AWS ALB Ingress Controller Annotations documentation](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.7/guide/ingress/annotations/) for more information.

