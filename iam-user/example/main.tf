locals {
  name   = "testuser3"
  region = "us-east-1"
}

provider "aws" {
  region = local.region
}

module "iam-user" {
  source = "../."
  name   = local.name

  tags = {
    "KeyStoragePath" : "NA"
    "RotationEnabled" : "NA"
    "DaysUntilAccessKeyRotation" : "NA"
    "DaysUntilAccessKeyDelete" : "NA"
    "DaysUntilAccessKeyOverlap" : "NA"
    "Team" : "NA"
    "Contact" : "NA"
    "Client" : "NA"
    "Description" : "NA"

  }
}

output "secret-name" {
  value = module.iam-user.iam-user-secret-name
}

output "secret-arn" {
  value = module.iam-user.iam-user-secret-arn
}