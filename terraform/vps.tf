// Partially based on https://github.com/squat/terraform-provider-vultr#examples,
// but modified to be compatible with the latest version of Vultr TF provider.

resource "vultr_instance" "cs4550_box" {
    region            = "ewr" // NJ
    plan              = "vc2-1c-1gb"
    os_id             = "352" // Debian 10 x64 (buster)
    ssh_key_ids       = [vultr_ssh_key.abyssinia_ssh_key.id]
    hostname          = "cs4550"
    tag               = "debian"
    firewall_group_id = vultr_firewall_group.web_dev.id
}

resource "vultr_snapshot" "cs4550_hw6" {
    instance_id = vultr_instance.cs4550_box.id
    description = "Homework 06 snapshot"
}

resource "vultr_snapshot" "cs4550_hw7" {
    instance_id = vultr_instance.cs4550_box.id
    description = "Homework 07 snapshot"
}

resource "vultr_firewall_group" "web_dev" {
    description = "firewall for cs4550 instances"
}

resource "vultr_firewall_rule" "ssh" {
    firewall_group_id = vultr_firewall_group.web_dev.id
    ip_type           = "v4"
    subnet            = "24.61.109.194"
    subnet_size       = 32
    protocol          = "tcp"
    port              = "22"
}

resource "vultr_firewall_rule" "http" {
    firewall_group_id = vultr_firewall_group.web_dev.id
    ip_type           = "v4"
    subnet            = "0.0.0.0"
    subnet_size       = 0
    protocol          = "tcp"
    port              = "80"
}

resource "vultr_firewall_rule" "https" {
    firewall_group_id = vultr_firewall_group.web_dev.id
    ip_type           = "v4"
    subnet            = "0.0.0.0"
    subnet_size       = 0
    protocol          = "tcp"
    port              = "443"
}

resource "vultr_firewall_rule" "http-dev" {
    firewall_group_id = vultr_firewall_group.web_dev.id
    ip_type           = "v4"
    subnet            = "0.0.0.0"
    subnet_size       = 0
    protocol          = "tcp"
    port              = "4000"
}
