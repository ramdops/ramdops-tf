output "iam-user-secret-name" {
  value = aws_secretsmanager_secret.iam-secret.name
}

output "iam-user-secret-arn" {
  value = aws_secretsmanager_secret.iam-secret.arn
}