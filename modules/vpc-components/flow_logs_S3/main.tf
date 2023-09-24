resource "aws_flow_log" "flow_log_s3" {
  count                = var.create_flow_logs_s3 ? 1 : 0
  log_destination      = aws_s3_bucket.log_bucket[0].arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
}

resource "aws_s3_bucket" "log_bucket" {
  count  = var.create_flow_logs_s3 ? 1 : 0
  bucket = "${var.name}-flow-logs-bucket"
}