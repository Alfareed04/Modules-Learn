
variable "vnet_details" {
    type = map(object({
      vnet_name = string
      address_space = list(string) 
      rg_location = string
      rg_name = string
    }))
  
}
