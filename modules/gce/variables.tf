variable "project" {
  description = "Projeto do GCP"
  type        = string
}
variable "region" {
  description = "Região do recurso"
  type        = string
}
variable "vpc_network" {
  description = "VPC Network"
  type        = string
}
variable "vpc_subnetwork" {
  description = "VPC Subnetwork"
  type        = string
}
variable "compute_name" {
  description = "Nome do Google Compute Engine"
  type        = string
}
variable "machine_type" {
  description = "Tipo da máquina do Google Compute Engine"
  type        = string
}
variable "zone" {
  description = "Zona onde a VM será alocada"
  type        = string
}
variable "disk_type" {
  description = "Tipo de disco utilizado no boot"
  type        = string
}
variable "disk_size" {
  description = "Capacidade do disco"
  type        = number
}
variable "image" {
  description = "Imagem do sistema Operacional"
  type        = string
}

variable "external_ip" {
  description = "External IP"
  type        = bool
}

variable "secondary_disk" {
  description = ""
  type        = bool
}

variable "secondary_disk_name" {
  description = ""
  type        = string
}

variable "secondary_disk_size" {
  description = ""
  type        = string
}

variable "secondary_disk_type" {
  description = ""
  type        = number
}