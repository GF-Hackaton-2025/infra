resource "aws_sqs_queue" "uploads-events-dead-letter" {
  name = "${var.uploadsQueueName}-dead-letter"
}

resource "aws_sqs_queue" "uploads-events" {
  name                       = var.uploadsQueueName
  visibility_timeout_seconds = var.visibilityTimeoutSeconds
  message_retention_seconds  = var.messageRetentionSeconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.uploads-events-dead-letter.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "files-processor-events-dead-letter" {
  name = "${var.filesProcessorQueueName}-dead-letter"
}

resource "aws_sqs_queue" "files-events" {
  name                       = var.filesProcessorQueueName
  visibility_timeout_seconds = var.visibilityTimeoutSeconds
  message_retention_seconds  = var.messageRetentionSeconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.files-processor-events-dead-letter.arn
    maxReceiveCount     = 5
  })
}