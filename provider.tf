terraform {
  required_version = ">= 1.8"
  required_providers {
    dotenv = {
      source  = "germanbrew/dotenv"
      version = "~> 1.2.7"
    }
    lambdalabs = {
      source  = "elct9620/lambdalabs"
      version = ">= 0.1.0"
    }
  }
}

provider "dotenv" {}

data "dotenv" "app" {
  filename = "${path.module}/.env"
}

locals {
  lambda_key = data.dotenv.app.entries.LAMBDALABS_API_KEY
  hf_token   = data.dotenv.app.entries.HF_TOKEN
}

provider "lambdalabs" {
  api_key = local.lambda_key
}
