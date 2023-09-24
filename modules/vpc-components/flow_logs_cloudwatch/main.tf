resource "aws_flow_log" "flow_logs" {
  count           = var.create_flow_logs_cloudwatch ? 1 : 0
  iam_role_arn    = aws_iam_role.log_iam_role[0].arn
  log_destination = aws_cloudwatch_log_group.log_group[0].arn
  traffic_type    = "ALL"
  vpc_id          = var.vpc_id
}

resource "aws_cloudwatch_log_group" "log_group" {
  count = var.create_flow_logs_cloudwatch ? 1 : 0
  name  = "${var.name}-log-group"
}

resource "aws_iam_role" "log_iam_role" {
  count = var.create_flow_logs_cloudwatch ? 1 : 0
  name  = "${var.name}-cloudwatch-log-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "log_iam_role_policy" {
  count = var.create_flow_logs_cloudwatch ? 1 : 0
  name  = "${var.name}-cloudwatch-log-policy"
  role  = aws_iam_role.log_iam_role[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}