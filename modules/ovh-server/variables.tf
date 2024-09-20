# # modules/ovh-server/variables.tf

variable "machine_list" {
  description = "List of OVH machines to install the OS on"
  type        = list(object({
    service_name    = string
    hostname        = string
    ui_display_name = string
    vrack_name      = string
  }))
}

# variable "ssh_key" {
#   description = "SSH public key for the root user"
#   type        = string
# }

# variable "ubuntu_template" {
#   description = "Name of the Ubuntu template to use"
#   type        = string
#   default     = "ubuntu_22.04_64"  # Default value, can be overridden
# }
