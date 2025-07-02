module "log_obfuscation" {
  source = "../nr_foundation_layer"
  account_id = var.nr_account_id
  obfuscation_rules = var.obfuscation_rules
  obfuscation_expressions   = var.obfuscation_expressions
  environment               = "test"
}
