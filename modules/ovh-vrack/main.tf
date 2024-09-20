# terraform {
#   required_version = ">= 1.4.6"
#   required_providers {
#     ovh = {
#       source = "ovh/ovh"
#     }
#   }
# }

# Fetch details of each OVH dedicated server
data "ovh_dedicated_server" "servers" {  
  for_each     = { for machine in var.machine_list : machine.service_name => machine }
  service_name = each.key
}

# Create a map of service_name to vrack_name
locals {
  service_to_vrack_map = { for machine in var.machine_list : machine.service_name => machine.vrack_name }
}

# Assign each OVH dedicated server to its corresponding VRack
resource "ovh_vrack_dedicated_server_interface" "vdsi" {
  for_each = { for machine in var.machine_list : machine.service_name => machine }  
  service_name = lookup(local.service_to_vrack_map, each.key, "")
  
  interface_id = data.ovh_dedicated_server.servers[each.key].enabled_vrack_vnis[0]  # Directly reference the correct interface_id

  # 'timeouts' is not supported on GitHub Action, when local run, please add it
  # timeouts {
  #   create = "10m"
  # }
}
