terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.20.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

# random string for sosol secret-key env variable
resource "random_string" "sosol-secret-key" {
  length           = 16
  special          = true
  override_special = "/@\" "
}
