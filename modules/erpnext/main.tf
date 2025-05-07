resource "kubernetes_namespace" "erpnext" {
  metadata { name = var.config.namespace }
}

resource "time_sleep" "wait_for_erpnext" {
  depends_on      = [ kubernetes_namespace.erpnext ]
  create_duration = "90s"
}

resource "kubernetes_manifest" "argocd_application_erpnext" {
  depends_on = [ time_sleep.wait_for_erpnext ]
  manifest   = var.config.argocd_manifest
}