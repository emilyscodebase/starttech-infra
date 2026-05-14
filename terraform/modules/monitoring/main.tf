# CloudWatch Log Group for Backend
resource "aws_cloudwatch_log_group" "backend" {
  name              = "/starttech/${var.project_name}/backend"
  retention_in_days = 14

  tags = {
    Name        = "${var.project_name}-backend-logs"
    Environment = var.environment
  }
}

# CloudWatch Log Group for Frontend
resource "aws_cloudwatch_log_group" "frontend" {
  name              = "/starttech/${var.project_name}/frontend"
  retention_in_days = 14

  tags = {
    Name        = "${var.project_name}-frontend-logs"
    Environment = var.environment
  }
}

# CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.project_name}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          title   = "EC2 CPU Utilization"
          region  = "us-east-1"
          period  = 300
          metrics = [["AWS/EC2", "CPUUtilization"]]
          view    = "timeSeries"
          stat    = "Average"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          title   = "ALB Request Count"
          region  = "us-east-1"
          period  = 300
          metrics = [["AWS/ApplicationELB", "RequestCount"]]
          view    = "timeSeries"
          stat    = "Sum"
        }
      }
    ]
  })
}

# CloudWatch Alarm for High CPU
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.project_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors EC2 CPU utilization"

  tags = {
    Name        = "${var.project_name}-high-cpu-alarm"
    Environment = var.environment
  }
}
