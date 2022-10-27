terraform {
  required_version = "~> 1.0" # minimum v1; maximum any minor.patch below v2. Please use latest minor.patch in local dev

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # minimum v3; maximum any minor.patch below v4. Please use latest minor.patch in local dev
    }
  }
}