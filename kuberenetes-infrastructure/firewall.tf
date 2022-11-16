
# Create Firewall to Deny internet access on in our vpc
# resource "google_compute_firewall" "deny-internet-access" {
#   project     = "wired-sol-367809"
#   name        = "deny-internet-access-from-vpc"
#   network     = google_compute_network.vpc_network.id
#   description = "Creates firewall rule deny internet access from our vpc_network"

#   deny {
#     protocol  = "all"
#   }

#   destination_ranges = ["0.0.0.0/0"]
#   direction= "EGRESS"
#   priority= 1000

# }



# Create Firewall to Deny internet access on in our VM
# resource "google_compute_firewall" "allow-internet-access-to-vm" {
#   project     = "wired-sol-367809"
#   name        = "allow-internet-access-on-vm"
#   network     = google_compute_network.vpc_network.id
#   description = "Creates firewall rule allow internet access from our VM"

#   allow {
#     protocol  = "all"
#   }

#   target_tags = ["bastion"]
#   destination_ranges = ["0.0.0.0/0"]
#   direction= "EGRESS"
#   priority= 900
# }



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

