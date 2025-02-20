provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "lab-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  hash_key = "RollNo."

  attribute {
    name = "RollNo."
    type = "N"
  }
}

resource "aws_dynamodb_table_item" "item1" {
  table_name = aws_dynamodb_table.dynamodb_table.name
  hash_key   = aws_dynamodb_table.dynamodb_table.hash_key
  item = <<ITEM
{
  "RollNo.": {"N": "1"},
  "Name": {"S": "Entry1"}
}
ITEM
}

resource "aws_dynamodb_table_item" "item2" {
  table_name = aws_dynamodb_table.dynamodb_table.name
  hash_key   = aws_dynamodb_table.dynamodb_table.hash_key
  item = <<ITEM
{
  "RollNo.": {"N": "2"},
  "Name": {"S": "Entry2"}
}
ITEM
}

resource "aws_dynamodb_table_item" "item3" {
  table_name = aws_dynamodb_table.dynamodb_table.name
  hash_key   = aws_dynamodb_table.dynamodb_table.hash_key
  item = <<ITEM
{
  "RollNo.": {"N": "3"},
  "Name": {"S": "Entry3"}
}
ITEM
}