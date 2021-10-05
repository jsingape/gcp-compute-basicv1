provider "google" {

  credentials = file("terrmaster.json")

  project = "testproject1-317716"
  region  = "us-east4"
  zone    = "us-east4-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
resource "google_compute_address" "static_ip" {
  name = "terraform-static-ip"
}
