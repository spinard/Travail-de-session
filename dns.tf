resource "google_dns_record_set" "jump" {
  name = "jump.spinard.cr460lab.com."
  type = "A"
  ttl  = 300

  managed_zone = "cr460lab"

  rrdatas = ["${google_compute_instance.jump.network_interface.0.access_config.0.assigned_nat_ip}"]
}

resource "google_dns_record_set" "vault" {
  name = "vault.spinard.cr460lab.com."
  type = "A"
  ttl  = 300

  managed_zone = "cr460lab"

  rrdatas = ["${google_compute_instance.vault.network_interface.0.access_config.0.assigned_nat_ip}"]
}
