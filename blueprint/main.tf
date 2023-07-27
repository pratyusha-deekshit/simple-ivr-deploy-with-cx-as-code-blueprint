
resource "genesyscloud_user" "demo_user5" {
  email           = "demo.user4@abcd.com"
  name            = "Demo User4"
  password        = "b@Zinga1972"
  state           = "active"
  department      = "IRA"
  title           = "Agent"
  acd_auto_answer = true
  addresses {

    phone_numbers {
      number     = "+9205551212"
      media_type = "PHONE"
      type       = "MOBILE"
    }
  }
  employer_info {
    official_name = "Demo User4"
    employee_id   = "12345"
    employee_type = "Full-time"
    date_hire     = "2023-03-18"
  }
}

resource "genesyscloud_tf_export" "export" {
  directory          = "./genesyscloud"
  export_as_hcl      = true
  resource_types     = ["genesyscloud_user"]
  include_state_file = true
}

data "local_file" "export_config" {
  filename = "${genesyscloud_tf_export.export.directory}/genesyscloud.tf"
}
