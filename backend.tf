terraform {
  backend "s3" {
    bucket = "i-hope-this-works-454545"
    key    = "projects/ec2/ec2-terraform/terraform.tfstates"
    #dynamodb_table = "terraform-lock"
  }
}