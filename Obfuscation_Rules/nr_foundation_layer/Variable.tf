variable "account_id" {
  type = number
}

variable "environment" {
  type = string
  # default = "test"
}


variable "obfuscation_rules" {
  type    = any
  
}

variable "obfuscation_expressions" {
  description = "Obfuscation Expressions"
  type        = any
}




