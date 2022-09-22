locals {
  access_policy = csvdecode(file("key_vault/access_policy.csv"))
}