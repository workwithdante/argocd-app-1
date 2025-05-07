output "namespace" {
  value = kubernetes_namespace.database.metadata[0].name
}