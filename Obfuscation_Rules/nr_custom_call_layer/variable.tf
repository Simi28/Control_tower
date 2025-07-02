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

variable "obfuscation_rules" {
  type    = any
}

variable "obfuscation_expressions" {
  type = any
}


