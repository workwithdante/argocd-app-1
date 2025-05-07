resource "kubernetes_namespace" "nfs" {
  metadata { name = var.config.namespace }
}

resource "helm_release" "nfs_server" {
  name       = var.config.release_name
  repository = var.config.repository
  chart      = var.config.chart
  namespace  = kubernetes_namespace.nfs.metadata[0].name

  # Pasa el bloque `values` directamente
  values = [yamlencode(var.config.values)]
}