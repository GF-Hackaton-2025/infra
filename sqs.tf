resource "aws_sqs_queue" "uploads-events-dead-letter" {
  name = "${var.queue_name}-dead-letter"
}

resource "aws_sqs_queue" "uploads-events" {
  name                       = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.uploads-events-dead-letter.arn
    maxReceiveCount     = 5
  })
}