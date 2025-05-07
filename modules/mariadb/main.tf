resource "kubernetes_namespace" "database" {
  metadata { name = var.config.namespace }
}

resource "kubernetes_secret" "mariadb_credentials" {
  metadata {
    name      = "mariadb-credentials"
    namespace = kubernetes_namespace.database.metadata[0].name
  }
  data = var.config.credentials
}

resource "time_sleep" "wait_for_mariadb" {
  depends_on      = [ kubernetes_namespace.database, kubernetes_secret.mariadb_credentials ]
  create_duration = "30s"
}

resource "kubernetes_manifest" "argocd_application_mariadb" {
  depends_on = [ time_sleep.wait_for_mariadb ]
  manifest   = var.config.argocd_manifest
}