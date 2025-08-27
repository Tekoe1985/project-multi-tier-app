terraform {
  backend "s3" {
    bucket       = "adzowa08"
    key          = "week7/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = false
  }
}