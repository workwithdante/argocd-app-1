terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.2.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "argocd" {
  port_forward_with_namespace = "argocd"
  insecure    = true
  plain_text  = true
}