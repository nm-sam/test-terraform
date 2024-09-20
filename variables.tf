#
# Nethermind Private Cloud
# Terraform v1.0 - OVH Cloud
# Copyright (c) Nethermind
#

variable "ovh_application_key" {
  description = "OVH application key"
  type        = string
  sensitive   = true
}

variable "ovh_application_secret" {
  description = "OVH application secret"
  type        = string
  sensitive   = true
}

variable "ovh_consumer_key" {
  description = "OVH consumer key"
  type        = string
  sensitive   = true
}

variable "machine_list" {
  description = "List of OVH machines to install the OS on"
  type = list(object({
    service_name    = string
    hostname        = string
    ui_display_name = string
    vrack_name      = string
  }))
}

# variable "ubuntu_template" {
#   description = "Name of the Ubuntu template to use"
#   type        = string  
#   default     = "ubuntu2204-server_64"  # The default template name from OVH  
# }

# variable "ssh_key" {
#   description = "SSH public key for the root user"
#   sensitive   = true
#   type        = string
# }

# variable "domain_zone" {
#   description = "DNS Domain Zone on OVH"
#   type        = string
# }