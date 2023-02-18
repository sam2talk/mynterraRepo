terraform {
  backend "s3" {
    bucket = "my-awst-tf-state-bucket"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "mytes-dynamo-db-table"
  }
}
