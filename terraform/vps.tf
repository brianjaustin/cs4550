// Partially based on https://github.com/squat/terraform-provider-vultr#examples,
// but modified to be compatible with the latest version of Vultr TF provider.

resource "vultr_snapshot" "cs4550_hw9" {
    instance_id = vultr_instance.cs4550_box.id
    description = "Homework 09 snapshot"
}

resource "vultr_snapshot" "cs4550_final" {
    instance_id = vultr_instance.cs4550_box.id
    description = "Final project snapshot"
}
