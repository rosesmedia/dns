variable "dns_record_comment" {
  description = "A comment to apply to all DNS records"
  type = string
  default = "This record is managed by terraform, any changes here will be overriden"
}

variable "roses_media_zone_id" {
  description = "The DNS zone id for roses.media"
  type = string
  default = "91caa50cb4a80c6cd9b3c5a9ece42194"
}