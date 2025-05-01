module "eks"{
    source = "terraform-aws-modules/eks/aws"
    version = "19.21.0"
    cluster_name = "autodeploy-eks"
    cluster_version = "1.29"
    subnet_ids = module.vpc.public_subnets
    vpc_id = module.vpc.vpc_id
    manage_aws_auth_configmap= true

    eks_managed_node_groups = {
        dev={
            desired_size=2
            max_size=3
            min_size=1

            instance_types= ["t2.micro"]
        }
    }

    tags={
        Enviroment="dev"
        Project="Autodeployhub"
    }
}