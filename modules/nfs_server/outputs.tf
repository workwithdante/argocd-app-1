output "namespace" {
  value = kubernetes_namespace.nfs.metadata[0].name
}