# # Configure the DNS Zone
# module "ovh-domain_zone" {
#   source = "./modules/ovh-dns"  
# }

# Configure the servers
module "ovh-server" {
  source       = "./modules/ovh-server"
  machine_list = var.machine_list
  # ssh_key = var.ssh_key
  # ubuntu_template = var.ubuntu_template
}

module "ovh-vrack" {
  source       = "./modules/ovh-vrack"
  machine_list = var.machine_list
}