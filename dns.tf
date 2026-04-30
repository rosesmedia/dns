# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  roses_media_cname_records = {
    media_roses_data = {
      name    = "data.roses.media"
      content = "k8s-kubesyst-traefik-e5fbc7536e-90f5cd3c624542b4.elb.eu-west-2.amazonaws.com"
    }
    media_roses_data_staging = {
      name    = "staging.data.roses.media"
      content = "k8s-kubesyst-traefik-e5fbc7536e-90f5cd3c624542b4.elb.eu-west-2.amazonaws.com"
    }
    media_roses_k8s_gfx_wildcard = {
      name    = "*.gfx.k8s.roses.media"
      content = "k8s-kubesyst-traefik-e5fbc7536e-90f5cd3c624542b4.elb.eu-west-2.amazonaws.com"
    }
    media_roses_dev_wildcard = {
      name    = "*.dev.roses.media"
      content = "vip.infra.ystv.co.uk"
    }
    media_roses_radio_ingest = {
      name    = "ingest.radio.roses.media"
      content = "uryrosesingest0.york.ac.uk"
    }
    media_roses_mumble = {
      name    = "mumble.roses.media"
      content = "tsuro.infra.archess.mn"
    }
    media_roses_wildcard = {
      name    = "*.roses.media"
      content = "vip.infra.ystv.co.uk"
    }
    media_roses = {
      name    = "roses.media"
      content = "rosesmedia.github.io"
    }
    media_roses_to_signup = {
      name    = "signup.to.roses.media"
      content = "vip.infra.ystv.co.uk"
    }
    media_roses_www = {
      name    = "www.roses.media"
      content = "roses.media"
    }
    media_roses_signup_www = {
      name    = "www.signup.roses.media"
      content = "vip.infra.ystv.co.uk"
    }
    media_roses_radio_stream = {
      name    = "stream.radio.roses.media"
      content = "urystreaming01.york.ac.uk"
    }
    meda_roses_radio_streaming = {
      name    = "streaming.radio.roses.media"
      content = "ury.york.ac.uk"
    }
    media_roses_radio_vase = {
      name    = "vase.radio.roses.media"
      content = "ury.york.ac.uk"
    }
  }
  roses_media_a_records = {
    media_roses_radio = {
      name    = "radio.roses.media"
      content = "144.32.64.162"
    }
    media_roses_radio_wildcard = {
      name    = "*.radio.roses.media"
      content = "144.32.64.162"
    }
  }
  roses_media_aaaa_records = {
  }
  roses_media_txt_records = {
    # Github domain verification
    media_roses__github-pages-challenge = {
      name    = "_github-pages-challenge-rosesmedia.roses.media"
      content = "\"f35044f68b1817ee82f89cb696106c\""
    }
  }
}

resource "cloudflare_dns_record" "records_cname_media_roses" {
  for_each = local.roses_media_cname_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "CNAME"
  zone_id  = var.roses_media_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "records_a_media_roses" {
  for_each = local.roses_media_a_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "A"
  zone_id  = var.roses_media_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "records_aaaa_media_roses" {
  for_each = local.roses_media_aaaa_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "AAAA"
  zone_id  = var.roses_media_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "records_txt_media_roses" {
  for_each = local.roses_media_txt_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "TXT"
  zone_id  = var.roses_media_zone_id
  settings = {}
  comment  = var.dns_record_comment

}
