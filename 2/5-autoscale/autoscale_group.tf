resource "aws_autoscaling_group" "auto_scale" {
launch_configuration = "${aws_launch_configuration.launch_config.id}"
  availability_zones = ["us-east-1a"]
  min_size         = 2
  max_size         = 5
  desired_capacity = 3

  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }
}


