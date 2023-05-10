resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
  address_type = "EXTERNAL"  # menentukan tipe alamat IP publik
}
 
resource "google_compute_instance" "vm_instance" {
  name         = "<INSTANCE-NAME>"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}
