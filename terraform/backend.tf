terraform {
  backend "s3" {
    bucket = "mycloudprojects-sanji"
    key    = "State-Files/terraform.tfstate"
    region = "ap-south-1"
  }
}
