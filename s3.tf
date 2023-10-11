resource "aws_s3_bucket_versioning" "my-s3-bucket" {
  bucket= "testingwithterra" 
  versioning_configuration {
    status = "Enabled"
  }
}

