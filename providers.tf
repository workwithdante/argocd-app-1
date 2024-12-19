provider "argocd" {
  port_forward_with_namespace = "argocd"
  insecure    = true
  plain_text  = true
}