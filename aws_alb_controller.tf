module "aws_alb_controller" {
  source                              = "github.com/mohamedezz96/Terraform-Modules/EKS-Tools/AWS-ALB-Controller"
  aws_alb_controller_version          = "1.7.2"
  eks_issuer                          = data.aws_eks_cluster.eks_data.identity[0].oidc[0].issuer
  cluster_name                        = "Testing" 
  alb_policy_name                     = "aws-alb-controller-policy"
  alb_role_name                       = "aws-alb-controller-role"
  alb_sa_name                         = "aws-alb-controller-serviceaccount"
  values_file                         = "./values/aws_alb_controller.yaml"
}
