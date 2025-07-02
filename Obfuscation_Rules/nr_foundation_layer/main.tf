resource "newrelic_obfuscation_expression" "expression" {
  for_each = var.obfuscation_expressions

  account_id  = try(each.value.account_id, var.account_id)
  name        = each.value.name
  description = try(each.value.description, "Obfuscation Expression")
  regex       = each.value.regex
}

resource "newrelic_obfuscation_rule" "rule" {
  for_each = var.obfuscation_rules

  account_id  = try(each.value.account_id, var.account_id)
  name        = each.value.name
  description = try(each.value.description, "Obfuscation Rule")
  filter      = each.value.filter
  enabled     = try(each.value.enabled, true)

  action {
    attribute     = each.value.attribute
    method        = each.value.method
    expression_id = newrelic_obfuscation_expression.expression[each.value.expression_key].id
  }
}
