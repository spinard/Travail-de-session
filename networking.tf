resource "google_compute_network" "cr460lab" {
  name                    = "cr460lab"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet-public" {
  name          = "subnet-public"
  ip_cidr_range = "172.16.1.0/24"
  network       = "${google_compute_network.cr460lab.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "subnet-workload" {
  name          = "subnet-workload"
  ip_cidr_range = "10.0.1.0/24"
  network       = "${google_compute_network.cr460lab.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "subnet-backend" {
  name          = "subnet-backend"
  ip_cidr_range = "10.0.2.0/24"
  network       = "${google_compute_network.cr460lab.self_link}"
  region        = "us-east1"
}
