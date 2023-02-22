resource "google_compute_network" "vpc" {
  name = "vikvpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet-europe-west4" {
  name = "subnet-europe-west4"
  network = google_compute_network.vpc.name
  ip_cidr_range = var.ip_cidr_range-west
  region = var.region
}