terraform {
  required_version = "~> 1.1.0"

  cloud {
    organization = "Compu-Global-Hyper-Mega-Net"
    workspaces {
      name = "import-eip"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Non-sensitive in TFC
variable "region" {}
variable "access_key" {}

# Sensitive in TFC
variable "secret_key" {}

provider "aws" {
  region     = var.region
  access_key = var.access_key

  secret_key = var.secret_key

  #secret_key = "STATIC STRING HERE"
  #token      = "STATIC STRING HERE"
}

resource "aws_eip" "e" {}
