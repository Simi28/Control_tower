
obfuscation_expressions = {
  "expr_mask_http" = {
    name        = "Mask HTTP"
    description = "Mask HTTP URLs"
    regex       = "(^http)"
  }

  "expr_mask_ip" = {
    name        = "Mask IP Address"
    description = "Mask all IPs"
    regex       = "(\\d+\\.\\d+\\.\\d+\\.\\d+)"
  }
}

obfuscation_rules = {
  "rule1" = {
    name           = "Mask HTTP from NGINX Logs"
    description    = "Rule 1 description"
    filter         = "logtype:nginx"
    enabled        = true
    attribute      = ["message"]
    method         = "MASK"
    expression_key = "expr_mask_http"
  }

  "rule2" = {
    name           = "Mask HTTP from Linux Logs"
    description    = "Rule 2 description"
    filter         = "logtype:linux"
    enabled        = true
    attribute      = ["message"]
    method         = "MASK"
    expression_key = "expr_mask_http"
  }
}
