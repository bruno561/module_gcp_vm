output "internal_network_ip" {
    description = "IP Interno da Rede"
    value       = google_compute_instance.compute_instance.network_interface.0.network_ip
}
/*output "external_network_ip" {
    description = "IP Externo da VM"
    value       = google_compute_instance.compute_instance.network_interface.0.access_config.0.nat_ip
}*/