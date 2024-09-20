# modules/ovh-vrack/variables.tf

variable "machine_list" {
  description = "List of OVH machines to install the OS on"
  type        = list(object({
    service_name    = string
    hostname        = string
    ui_display_name = string
    vrack_name      = string
  }))
}