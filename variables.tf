variable "kubeconfig" {
  description = "Ruta al kubeconfig"
  type        = string
  default     = "config"
}

variable "config_file" {
  description = "Nombre de tu YAML de configuración"
  type        = string
  default     = "values.yaml"
}