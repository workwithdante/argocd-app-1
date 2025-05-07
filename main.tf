locals {
  config = yamldecode(
    file("${path.module}/${var.config_file}")
  )
}

module "argocd" {
  source = "./modules/argocd"
  config = local.config.argocd
}

module "nfs_server" {
  source     = "./modules/nfs_server"
  config     = local.config.nfs_server
  depends_on = [ module.argocd ]
}

module "mariadb" {
  source     = "./modules/mariadb"
  config     = local.config.mariadb
  depends_on = [ module.argocd ]
}

module "erpnext" {
  source     = "./modules/erpnext"
  config     = local.config.erpnext
  depends_on = [ module.argocd ]
}