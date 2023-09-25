
# Initialize the S3 backend configuration
terraform {
  backend "s3" {
    bucket         = "your-unique-bucket-name"   # Replace with your S3 bucket name
    key            = "terraform.tfstate"         # Replace with your desired state file name
    region         = "us-east-1"                 # Change to your desired AWS region
    encrypt        = true                        # Enable encryption at rest (optional)
    dynamodb_table = "your-lock-table-name"      # Replace with an optional DynamoDB table name for state locking
  }
}
