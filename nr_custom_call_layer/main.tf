module "log_parsing_rules" {
  source                  = "../nr_foundation_layer/Parsing_Rules"
  account_id             = var.nr_account_id
  parsing_rules_details =    var.custom_parsing_rules
  # grok_validation_enabled = var.grok_validation_enabled
  environment = "test"
}
