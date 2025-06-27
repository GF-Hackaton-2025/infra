resource "aws_sqs_queue" "uploads-events-dead-letter" {
  name = "${var.queueName}-dead-letter"
}

resource "aws_sqs_queue" "uploads-events" {
  name                       = var.queueName
  visibility_timeout_seconds = var.visibilityTimeoutSeconds
  message_retention_seconds  = var.messageRetentionSeconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.uploads-events-dead-letter.arn
    maxReceiveCount     = 5
  })
}