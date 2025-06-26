# resource "newrelic_log_parsing_rule" "log_parser" {
#   for_each = var.parsing_rules_details

#   account_id  = var.account_id
#   name        = each.value.name
#   attribute   = each.value.attribute
#   enabled     = try(each.value.enabled, true)
#   grok        = var.grok_validation_enabled ? data.newrelic_test_grok_pattern.grok[each.key].grok : each.value.grok
#   lucene      = each.value.lucene
#   nrql        = each.value.nrql
#   matched     = var.grok_validation_enabled ? data.newrelic_test_grok_pattern.grok[each.key].test_grok[0].matched : null
# }

# data "newrelic_test_grok_pattern" "grok" {
#   for_each   = var.grok_validation_enabled ? var.parsing_rules_details : {}
#   grok       = each.value.grok
#   log_lines  = try(each.value.test_log_lines, [])
# }

resource "newrelic_log_parsing_rule" "log_parser" {
  for_each = var.parsing_rules_details

  account_id  = try(each.value.account_id, var.account_id)
  name        = each.value.name
  attribute   = each.value.attribute
  enabled     = try(each.value.enabled, true)
  lucene      = each.value.lucene
  nrql        = each.value.nrql

  grok = contains(keys(data.newrelic_test_grok_pattern.grok), each.key) ? data.newrelic_test_grok_pattern.grok[each.key].grok: each.value.grok
  matched = contains(keys(data.newrelic_test_grok_pattern.grok), each.key) ? data.newrelic_test_grok_pattern.grok[each.key].test_grok[0].matched : null
}


data "newrelic_test_grok_pattern" "grok" {
  for_each = {
    for key, rule in var.parsing_rules_details :key => rule if try(length(rule.test_log_lines), 0) > 0
  }
  grok      = each.value.grok
  log_lines = each.value.test_log_lines
  account_id = try(each.value.account_id, var.account_id)
}
