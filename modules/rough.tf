resource "aws_ecs_service" "my_service" {
  name            = "my-ecs-service"
  cluster        = aws_ecs_cluster.my_cluster.id
  launch_type    = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.private[*].id  # Pass multiple subnets
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false  # Set to true if using public subnets
  }

  desired_count = 2  # ECS will distribute tasks across AZs
}


resource "aws_autoscaling_group" "ecs_asg" {
  name                 = "ecs-asg"
  min_size             = 2
  max_size             = 5
  desired_capacity     = 2
  vpc_zone_identifier  = aws_subnet.private[*].id  # Multiple subnets for multi-AZ
  launch_configuration = aws_launch_configuration.ecs_lc.id
}
