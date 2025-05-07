output "namespace" {
  value = kubernetes_namespace.erpnext.metadata[0].name
}