
# Create Firewall to allow ssh access on in our VM
resource "google_compute_firewall" "allow-ssh-to-vm" {
  project     = "wired-sol-367809"
  name        = "allow-ssh-to-vm"
  network     = google_compute_network.vpc_network.id
  description = "Creates firewall rule allow ssh to our VM"
  direction= "INGRESS"
  source_ranges = ["35.235.240.0/20"]  
  
  allow {
    protocol  = "tcp"
    ports     = ["22", "80"]
  }



}

