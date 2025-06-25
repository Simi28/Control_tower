resource "newrelic_log_parsing_rule" "log_parser" {
  for_each = var.parsing_rules_details

  account_id  = var.account_id
  name        = each.value.name
  attribute   = each.value.attribute
  enabled     = try(each.value.enabled, true)
  grok        = var.grok_validation_enabled ? data.newrelic_test_grok_pattern.grok[each.key].grok : each.value.grok
  lucene      = each.value.lucene
  nrql        = each.value.nrql
  matched     = var.grok_validation_enabled ? data.newrelic_test_grok_pattern.grok[each.key].test_grok[0].matched : null
}

data "newrelic_test_grok_pattern" "grok" {
  for_each   = var.grok_validation_enabled ? var.parsing_rules_details : {}
  grok       = each.value.grok
  log_lines  = try(each.value.test_log_lines, [])
}

