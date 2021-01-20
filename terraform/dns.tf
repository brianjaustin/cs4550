resource "vultr_dns_domain" "baustin_neu_site" {
    domain = "baustin-neu.site"
    ip     = vultr_instance.cs4550_box.main_ip
}

resource "vultr_dns_record" "www_baustin_neu" {
    domain = vultr_dns_domain.baustin_neu_site.id
    name   = "www"
    data   = vultr_instance.cs4550_box.main_ip
    type   = "A"
}
