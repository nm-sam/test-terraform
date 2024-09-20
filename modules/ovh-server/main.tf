# terraform {
#   required_version = ">= 1.4.6"
#   required_providers {
#     ovh = {
#       source = "ovh/ovh"
#     }
#   }
# }

data "ovh_dedicated_server_boots" "rescue" {
  for_each     = { for machine in var.machine_list : machine.service_name => machine }
  service_name = each.key
  # boot_type    = "rescue"
}

resource "ovh_dedicated_server_update" "server" {
  for_each      = { for machine in var.machine_list : machine.service_name => machine }
  service_name  = each.key
  boot_id       = data.ovh_dedicated_server_boots.rescue[each.key].result[0]
  monitoring    = true
  state         = "ok"
  display_name  = each.value.ui_display_name
}

# resource "ovh_dedicated_server_install_task" "server_install" {
#   for_each          = { for machine in var.machine_list : machine.service_name => machine }
#   service_name      = each.key
#   template_name     = var.ubuntu_template
#   bootid_on_destroy = data.ovh_dedicated_server_boots.rescue[each.key].result[0]

#   details {
#     custom_hostname = each.value.hostname
#   }

#   user_metadata {
#     key   = "sshKey"
#     value = var.ssh_key
#   }

#   # 'timeouts' is not supported on GitHub Action, when local run, please use it
#   # timeouts {
#   #   # Extend this based on the estimated OS installation time
#   #   # It's important, without this, Terraform cannot get the installation status when OS is ready
#   #   create = "60m"
#   # }
# }
