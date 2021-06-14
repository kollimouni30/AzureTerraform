

variable storage_entity {
  description = "A map of storage accounts to create"
  type = map(object({
    sa_name                    = string
    sa_rg_name                 = string
    sa_rg_region               = string
    sa_tier                    = string
    sa_access_tier             = string
    sa_replication_type        = string 
    sa_kind                    = string
    enable_https_traffic_only  = bool
    is_hns_enabled             = bool
    allowed_subnet              = list(string)
  }))
  default     = {}
      
}

variable pe_entity {
  description = "A map of storage accounts to create"
  type = map(object({
    subnet_id                  = any
    is_manual_connection       = bool
    subresource_names          = list(string)
    pe_name                    = any
    storage_entity_map         = string
    sa_rg_name                 = string
    sa_rg_region               = string
    private_dns_zone_ids       = any
    private_dns_zone_name      = string   
  }))
  default     = {}
      
}
variable tags {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable containers {
  type = map(object({
    name        = string
    sa_name     = string
    access_type = string
  }))
  description = "List of storage containers."
  default = {}
}

variable shares {
  type = map(object({
    name  = string
    sa_name     = string
    quota = number
  }))
  description = "List of storage shares."
  default = {}
}

variable module_depends_on {
  type = any
  default = null
}