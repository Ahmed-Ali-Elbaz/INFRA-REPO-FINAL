
resource "google_compute_instance" "bastion" {
  name         = "bastion-host"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["bastion"]

  boot_disk {

    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "instance1"
      }
    }
    

    
  }


  network_interface {
    network = google_compute_network.vpc_network.id

    subnetwork = google_compute_subnetwork.management-subnet.id
    
  }


  service_account {
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }


}