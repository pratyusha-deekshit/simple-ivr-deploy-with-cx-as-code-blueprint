terraform {
  backend "remote" {
    organization = "TestPD2442"

    workspaces {
      name = "autoApplySimpleIVR"
    }
  }

  required_providers {
    genesyscloud = {
      source = "mypurecloud/genesyscloud"
    }
  }
}

provider "genesyscloud" {
  sdk_debug = true
}

resource "genesyscloud_tf_export" "export" {
  directory          = "./genesyscloud"
  resource_types     = ["genesyscloud_user"]
  include_state_file = true
}
