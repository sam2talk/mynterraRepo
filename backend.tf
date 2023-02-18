terraform {
  backend "s3" {
    bucket = "my-dev-tf-state-bucketjan25"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "terratestingDBe"
  }
}
