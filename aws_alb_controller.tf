module "aws_alb_controller" {
  source                              = "github.com/mohamedezz96/Terraform-Modules/EKS-Tools/AWS-ALB-Controller"
  aws_alb_controller_version          = "1.7.2"
  eks_issuer                          = data.aws_eks_cluster.eks_data.identity[0].oidc[0].issuer
  cluster_name                        = "Testing" 
  values_file                         = "./values/aws_alb_controller.yaml"
}
