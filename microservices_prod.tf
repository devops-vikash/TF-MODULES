
resource "google_container_cluster" "vik-prod-cluster" {
  name     = "vik-prod-cluster"
  location = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  network = google_compute_network.vpc.self_link
  subnetwork =  google_compute_subnetwork.subnet-europe-west4.self_link
  
}

resource "google_container_node_pool" "prod-node-pool" {
  name       = "prod-node-pool"
  cluster    = google_container_cluster.vik-prod-cluster.name
  location = var.zoneS
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    
  }
      
  }


resource "google_compute_instance" "default2" {
  name         = "vik-tf-server-1"
  machine_type = var.machine_type
  tags         = ["http-server"]
  labels = {
    application_name = "microservices1"
    enviroment = "prod"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; sudo service restart"

  network_interface {
      subnetwork = "subnet-europe-west4"

    access_config {
      // Ephemeral IP
    }
  }
}