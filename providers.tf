provider "ovh" {
  endpoint           = "ovh-ca" # Set the correct OVH endpoint
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}
