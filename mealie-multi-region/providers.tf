terraform {
  required_version = ">= 1.3.0"
}

provider "aws" {
  alias  = "france"
  region = "eu-west-3"
}

provider "aws" {
  alias  = "allemagne"
  region = "eu-central-1"
}
