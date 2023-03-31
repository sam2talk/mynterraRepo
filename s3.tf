resource "aws_s3_bucket_versioning" "my-s3-bucket" {
  bucket= "de-tf-state-bucket1" 
  versioning_configuration {
    status = "Enabled"
  }
}

