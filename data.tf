data "aws_eks_cluster" "eks_data" {
  name = module.alb_aws_controller.cluster_name
}
