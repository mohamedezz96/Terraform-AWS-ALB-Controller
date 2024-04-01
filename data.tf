data "aws_eks_cluster" "eks_data" {
  name = module.aws_alb_controller.cluster_name
}
