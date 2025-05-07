// modules/argocd/main.tf
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.config.namespace
  }
}

resource "helm_release" "argocd" {
  name             = var.config.release_name
  repository       = var.config.repository
  chart            = var.config.chart
  version          = var.config.version
  namespace        = kubernetes_namespace.argocd.metadata[0].name
  create_namespace = var.config.create_namespace

  # El flag installCRDs debe venir desde values.yaml (var.config.values)
  values = [ yamlencode(var.config.values) ]
}