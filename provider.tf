terraform {
  required_providers {
    dotenv = {
      source  = "arangamani/dotenv"
      version = ">= 1.0.0"
    }
    lambdalabs = {
      source  = "elct9620/lambdalabs"
      version = ">= 0.1.0"
    }
  }
}

provider "dotenv" {
  filename = "${path.module}/.env"
}

provider "lambdalabs" {
  api_key = dotenv_variable.lambdalabs_api_key.value
}

data "dotenv_variable" "lambdalabs_api_key" {
  key = "LAMBDALABS_API_KEY"
}
