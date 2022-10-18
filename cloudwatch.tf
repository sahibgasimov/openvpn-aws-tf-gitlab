resource "aws_cloudwatch_metric_alarm" "cpu" {
  alarm_name                = "cpu_openvpn_over_80_percent"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  alarm_actions             = [var.sns]
  insufficient_data_actions = []
  dimensions = {
    InstanceId = var.instance_id
  }
}
#status check ec2_statuscheckfailed_instance 
resource "aws_cloudwatch_metric_alarm" "ec2_statuscheckfailed_instance" {
  alarm_name          = "openvpn_ec2_statuscheck_failed_instance"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "1"
  actions_enabled     = true
  alarm_actions       = [var.sns]
  alarm_description   = "This metric monitors the status of the instance status check"

  dimensions = {
    InstanceId = var.instance_id
  }
}

#status check StatusCheckFailed_System 
resource "aws_cloudwatch_metric_alarm" "openvpn_ec2_StatusCheckFailed_System" {
  alarm_name          = "openvpn_ec2_StatusCheckFailed_System"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "1"
  actions_enabled     = true
  alarm_actions       = [var.sns]
  alarm_description   = "This metric monitors the status of the instance status check"

  dimensions = {
    InstanceId = var.instance_id
  }
}


resource "aws_cloudwatch_dashboard" "dashboard-terraform" {
  dashboard_name = "terra-cloudwatch-dashboard-1"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "CWAgent",
            "disk_used_percent",
            "InstanceId",
            "${var.instance_id}",
            "path",
             "/",
            "device",
            "xvda1",
            "fstype",
            "ext4"
          ]
        ],
        "period": 180,
        "stat": "Average",
        "region": "us-east-1",
        "stacked": true,
        "title": "EC2 Instance Disk Used"
      }
    }
    
    
  ]
}
EOF

}


resource "aws_cloudwatch_metric_alarm" "disk_used_percent" {
  alarm_name                = "openvpn_disk_used_percent"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "disk_used_percent"
  namespace                 = "CWAgent"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 disk utilization"
  actions_enabled           = "true"
  alarm_actions             = [var.sns]
  insufficient_data_actions = []
  #treat_missing_data = "notBreaching"

   dimensions = {
     path = "/"
    InstanceId = "${var.instance_id}"
     device = "xvda1"
    
    fstype = "ext4"
   
   
  }
}

#mem_used_percent
resource "aws_cloudwatch_metric_alarm" "mem_used_percent" {
  alarm_name                = "openvpn_mem_used_percent"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "mem_used_percent"
  namespace                 = "CWAgent"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 disk utilization"
  actions_enabled           = "true"
  alarm_actions             = [var.sns]
  insufficient_data_actions = []
  #treat_missing_data = "notBreaching"

   dimensions = {
    InstanceId = "${var.instance_id}"   
  }
}
