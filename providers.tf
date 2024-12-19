terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.2.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "kubernetes" {
  # Se hereda del módulo principal
}

provider "helm" {
  # Se hereda del módulo principal
}

provider "argocd" {
  # Se hereda del módulo principal
}