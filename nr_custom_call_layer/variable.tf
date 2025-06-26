variable "nr_account_id" {
  type       = number
}

variable "nr_api_key" {
  type        = string
  
}

variable "nr_region" {
  type        = string
  description = "New Relic region, valid values are 'US' and 'EU'"
  default     = "US"
}

variable "custom_parsing_rules" {
  type = any
}

# variable "grok_validation_enabled" {
#   type = any
# }

