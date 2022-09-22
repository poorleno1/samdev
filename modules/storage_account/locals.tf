locals {
  data_lake_ace_settings = {
    user = {
      ace_scope       = "access"
      ace_type        = "user"
      ace_permissions = "rwx"
    }
    group = {
      ace_scope       = "access"
      ace_type        = "group"
      ace_permissions = "r-x"
    }
    mask = {
      ace_scope       = "access"
      ace_type        = "mask"
      ace_permissions = "rwx"
    }
    other = {
      ace_scope       = "access"
      ace_type        = "other"
      ace_permissions = "---"
    }
  }

  data_lake_containers = csvdecode(file("storage_account/containers.csv"))

  role_assignments = csvdecode(file("storage_account/roles.csv"))

}

