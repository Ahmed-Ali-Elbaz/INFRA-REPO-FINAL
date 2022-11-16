# Create a Router for NAT
resource "google_compute_router" "nat-router" {
  name    = "nat-router"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.vpc_network.id

}


# Create a NAT
resource "google_compute_router_nat" "nat" {

  name                               = "my-router-nat"
  router                             = google_compute_router.nat-router.name
  region                             = google_compute_router.nat-router.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"


    # subnetwork {
    #     name                    = google_compute_subnetwork.management-subnet.id
    #     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    # }

  nat_ips = [google_compute_address.nat-ip.self_link]


}

resource "google_compute_address" "nat-ip" {
  
  name = "nat-ip"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"


}
