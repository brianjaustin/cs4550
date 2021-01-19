data "vultr_region" "new_york" {
    filter {
        name   = "name"
        values = ["New York"]
    }
}

data "vultr_os" "debian" {
    filter {
        name   = "family"
        values = ["debian"]
    }
}

data "vultr_plan" "starter" {
    filter {
        name   = "price_per_month"
        values = ["5.00"]
    }

    filter {
        name   = "ram"
        values = ["1024"]
    }
}

resource "vultr_instance" "cs4550_box" {
    name              = "cs4550-box"
    region_id         = data.vultr_region.new_york.id
    plan_id           = data.vultr_plan.starter.id
    os_id             = data.vultr_os.debian.id
    ssh_key_ids       = [vultr_ssh_key.abyssinia_ssh_key.id]
    hostname          = "cs4550"
    tag               = "debian"
    firewall_group_id = vultr_firewall_group.web_dev.id
}

resource "vultr_firewall_group" "web_dev" {
    description = "firewall for cs4550 instances"
}

resource "vultr_firewall_rule" "ssh" {
    fireall_group_id = vultr_firewall_group.web_dev.id
    subnet           = "24.61.109.194"
    subnet_size      = 0
    protocol         = "tcp"
    from_port        = 22
    to_port          = 22
}

resource "vultr_firewall_rule" "http" {
    fireall_group_id = vultr_firewall_group.web_dev.id
    subnet           = "0.0.0.0"
    subnet_size      = 0
    protocol         = "tcp"
    from_port        = 80
    to_port          = 80
}

resource "vultr_firewall_rule" "https" {
    fireall_group_id = vultr_firewall_group.web_dev.id
    subnet           = "0.0.0.0"
    subnet_size      = 0
    protocol         = "tcp"
    from_port        = 443
    to_port          = 443
}

resource "vultr_firewall_rule" "http-dev" {
    fireall_group_id = vultr_firewall_group.web_dev.id
    subnet           = "0.0.0.0"
    subnet_size      = 0
    protocol         = "tcp"
    from_port        = 4000
    to_port          = 4000
}
