terraform {
  backend "consul" {
    address = "consul.service.consul:8500"
    scheme = "http"
    path = "terraform/rosesmedia/dns"
    lock = true
  }
  
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {}
