terraform {
  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.2.0"  # Asegúrate de que esta versión coincide con la que defines en el root
    }
  }
}

provider "argocd" {
  # La configuración se hereda del módulo principal
}