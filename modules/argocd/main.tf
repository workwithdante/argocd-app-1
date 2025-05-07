resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.config.namespace
  }
}

# Instalar los CRDs de ArgoCD aplicando directamente el YAML oficial
resource "kubernetes_manifest" "argocd_crds" {
  manifest = yamldecode(file("${path.module}/crds.yaml"))
}

# Helm release principal de ArgoCD, que depende de los CRDs
resource "helm_release" "argocd" {
  depends_on       = [ kubernetes_manifest.argocd_crds ]
  name             = var.config.release_name
  repository       = var.config.repository
  chart            = var.config.chart
  version          = var.config.version
  namespace        = kubernetes_namespace.argocd.metadata[0].name
  create_namespace = var.config.create_namespace

  values = [ yamlencode(var.config.values) ]
}