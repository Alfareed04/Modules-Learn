variable "stg_name" {
    type = map(object({
      name = string
      rg_name = string
      location = string
      account_tier = string
      account_replication_type = string
    }))
}