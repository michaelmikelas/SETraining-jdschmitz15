terraform {
  required_providers {
    illumio-core = {
      source = "illumio/illumio-core"
    }
  }
}

provider "illumio-core" {
  pce_host     = "https://${var.pce_url}:${var.port}"
  api_username = var.api_user
  api_secret   = var.api_secret
  org_id       = var.org
}
