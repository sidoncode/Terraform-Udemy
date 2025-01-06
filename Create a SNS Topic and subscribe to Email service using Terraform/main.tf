
# File: main.tf
provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_sns_topic" "sns_topic" {
    name = "lab-sns"
}

resource "aws_sns_topic_subscription" "sns_subscription" {
    topic_arn = aws_sns_topic.sns_topic.arn
    protocol= "email"
    endpoint= var.sns_subscription_email
}
