terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.62.1"
    }
  }
}

# CONFIGURE THE NEW RELIC PROVIDER
provider "newrelic" {
  account_id = var.nr_account_id
  api_key    = var.nr_api_key # USUALLY PREFIXED WITH 'NRAK'
  region     = var.nr_region  # VALID REGIONS ARE US AND EU
}