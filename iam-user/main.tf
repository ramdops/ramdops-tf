module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4"

  name                          = var.name
  create_iam_user_login_profile = false
  create_iam_access_key         = var.create_iam_access_key
  tags                          = var.tags
}

resource "aws_secretsmanager_secret" "iam-secret" {
  name = "${var.name}-credentials"
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "iam-secret-version" {
  secret_id     = aws_secretsmanager_secret.iam-secret.id
  secret_string = <<EOF
   {
    "AWS_IAM_USER": ${module.iam_user.iam_user_name},
    "AWS_ACCESS_KEY_ID": ${module.iam_user.iam_access_key_id},
    "AWS_SECRET_ACCESS_KEY": ${module.iam_user.iam_access_key_secret}
   }
EOF
}

