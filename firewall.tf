
resource "google_compute_firewall" "fw-outside-public" {
  name    = "fw-outside-public"
  network = "${google_compute_network.cr460lab.name}"
  allow {
    protocol = "tcp"
    ports    = ["22","80","443"]
  }
  target_tags  = ["subnet-public"]
}


resource "google_compute_firewall" "fw-public-workload" {
  name    = "fw-public-workload"
  network = "${google_compute_network.cr460lab.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_tags = ["subnet-public"]
  target_tags  = ["subnet-workload"]
}

resource "google_compute_firewall" "fw-backend" {
  name    = "fw-backend"
  network = "${google_compute_network.cr460lab.name}"
  allow {
    protocol = "tcp"
    ports    = ["22","2379","2380"]
  }
  source_tags = ["subnet-public","subnet-workload"]
  target_tags  = ["subnet-backend"]
}
