provider "google" {
  project = var.project
  region  = var.region
  alias   = "admin-network"
}
data "google_compute_network" "vpc_shared" {
  name     = var.vpc_network
  provider = google.admin-network
  project  = var.project
}

data "google_compute_subnetwork" "vpc_subnetwork" {
  project = var.project
  name    = var.vpc_subnetwork
  region  = var.region
}

resource "google_compute_disk" "default" {
  count   = var.secondary_disk == true ? 1 : 0
  project = var.project
  name    = var.secondary_disk_name
  zone    = var.zone
  size    = var.secondary_disk_size
  type    = var.secondary_disk_type
}

resource "google_compute_instance" "default" {
  project      = var.project
  name         = var.compute_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = var.disk_type
    }
  }
  network_interface {
    network    = data.google_compute_network.vpc_shared.self_link
    subnetwork = data.google_compute_subnetwork.vpc_subnetwork.self_link

    dynamic "access_config" {
      for_each = var.external_ip == false ? [] : [1]
      content {
      }
    }
  }
  depends_on = [
    google_compute_disk.default
  ]
}
resource "google_compute_attached_disk" "default" {
  count    = var.secondary_disk == true ? 1 : 0
  disk     = google_compute_disk.default[0].id
  instance = google_compute_instance.default.id

  depends_on = [
    google_compute_disk.default
  ]
}