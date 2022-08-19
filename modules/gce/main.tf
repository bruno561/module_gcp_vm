provider "google" {
  project             = var.project
  region              = var.region
  alias               = "admin-network"
}
data "google_compute_network" "vpc_shared" {
  name                    = var.vpc_network
  provider                = google.admin-network
  project                 = var.project
}

data "google_compute_subnetwork" "vpc_subnetwork" {
    project           = var.project
    name              = var.vpc_subnetwork
    region            = var.region
}

resource "google_compute_instance" "compute_instance" {
  project             = var.project
  name                = var.compute_name
  machine_type        = var.machine_type
  zone                = var.zone
    boot_disk {
      initialize_params {
          image       = var.image
          size        = var.disk_size
          type        = var.disk_type
      }
    }
  network_interface {
    network           = "${data.google_compute_network.vpc_shared.self_link}"
    subnetwork        = "${data.google_compute_subnetwork.vpc_subnetwork.self_link}"
    access_config {
      nat_ip = var.nat_ip
      network_tier = var.network_tier
    }
  }
}