module "pudim" {
  # source                      = "github.com/msfidelis/linuxtips-curso-containers-ecs-service-module?ref=v1.2.0"
  source         = "/Users/matheus/Workspace/linuxtips/linuxtips-curso-containers-ecs-service-module"
  region         = "us-east-1"
  cluster_name   = "linuxtips-ecs-cluster"
  service_name   = "pudim"
  service_port   = "80"
  service_cpu    = 256
  service_memory = 512


  service_listener = data.aws_ssm_parameter.listener.value

  alb_arn                     = data.aws_ssm_parameter.alb.value
  service_task_execution_role = aws_iam_role.main.arn


  service_healthcheck = {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 10
    interval            = 60
    matcher             = "200-399"
    path                = "/"
    port                = 80
  }

  service_launch_type = [
    {
      capacity_provider = "FARGATE_SPOT"
      weight            = 100
    }
  ]
  service_hosts = [
    "pudim.linuxtips.demo",
  ]

  container_image = "fidelissauro/pudim:latest"

  vpc_id = data.aws_ssm_parameter.vpc_id.value
  private_subnets = [
    data.aws_ssm_parameter.private_subnet_1.value,
    data.aws_ssm_parameter.private_subnet_2.value,
    data.aws_ssm_parameter.private_subnet_3.value,
  ]

  service_task_count = 1

  task_minimum = 1
  task_maximum = 1

  service_discovery_namespace = data.aws_ssm_parameter.service_discovery_namespace.value
}