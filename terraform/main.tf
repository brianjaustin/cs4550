terraform {
    required_version = "~> 0.14.4"

    backend "remote" {
        organization = "northeastern"
        
        workspaces {
            name = "cs4550"
        }
    }

    required_providers {
        vultr = {
            source  = "vultr/vultr"
            version = "~> 2.1.2"
        }
    }
}
