module "alb_controller" {
  source          = "./Modules/AWS-ALB-Controller"
  eks_issuer      = data.aws_eks_cluster.eks_data.identity[0].oidc[0].issuer
  cluster_name    = "Testing" 
  alb_policy_name = "aws-alb-controller-policy"
  alb_role_name   = "aws-alb-controller-role"
  alb_sa_name     = "aws-alb-controller-serviceaccount"
  values_file     = "./values/alb_controller.yaml"
}
