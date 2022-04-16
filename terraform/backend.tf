terraform {
  backend "s3" {
    bucket = "bogdan-20220414100057"
    key    = "terraform/jenkinsstate"
    region = "eu-central-1"
  }
}