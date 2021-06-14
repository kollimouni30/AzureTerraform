  # stg act vars
  storage_entity = {
    sa1 = {
    	  sa_name                    = "ctestst4251"
        sa_rg_name                 = "etestrg4251"
        sa_rg_region               = "West Europe"
        sa_tier                    = "Standard"
        sa_access_tier             = "hot"
        sa_replication_type        = "ZRS"
        sa_kind                    = "StorageV2"
        enable_https_traffic_only  = true
        is_hns_enabled             = false
        allowed_subnet             = ["/subscriptions/95537715-aa96-46bc-ab61-a17c5a832d13/resourceGroups/etestrg4251/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"]
        }
    sa2 = {
      sa_name                      = "ctestst8410"
        sa_rg_name                 = "etestrg4251"
        sa_rg_region               = "West Europe"
        sa_tier                    = "Standard"
        sa_access_tier             = "hot"
        sa_replication_type        = "ZRS"
        sa_kind                    = "StorageV2"
        enable_https_traffic_only  = true
        is_hns_enabled             = false
        allowed_subnet             = ["/subscriptions/95537715-aa96-46bc-ab61-a17c5a832d13/resourceGroups/etestrg4251/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"]        
        }
    sa3 = {
      sa_name                      = "ctestst1620"
        sa_rg_name                 = "etestrg4251"
        sa_rg_region               = "West Europe"
        sa_tier                    = "Standard"
        sa_access_tier             = "hot"
        sa_replication_type        = "ZRS"
        sa_kind                    = "StorageV2"
        enable_https_traffic_only  = true
        is_hns_enabled             = false
        allowed_subnet             = ["/subscriptions/95537715-aa96-46bc-ab61-a17c5a832d13/resourceGroups/etestrg4251/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"]        
        }
  }

tags = {
  
}

  containers = {
    ca1 = {
      sa_name  = "ctestst4251"
      name = "contdomtest4251"
      access_type = "private"
    }
    ca2 = {
      sa_name  = "ctestst8410"
      name = "contdomtest8410"
      access_type = "private"
    }
    ca3 = {
      sa_name  = "ctestst1620"
      name = "contdomtest1620"
      access_type = "private"
    }

  }
pe_entity = {
    pe1 = {
    	  subnet_id                  = "/subscriptions/95537715-aa96-46bc-ab61-a17c5a832d13/resourceGroups/etestrg4251/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"
        is_manual_connection       = "false"
        sa_rg_name                 = "etestrg4251"
        sa_rg_region               = "West Europe"
        subresource_names          = ["blob"]
        pe_name                    = "testpe1"
        storage_entity_map         = "sa3"
        private_dns_zone_ids       = "test"
        private_dns_zone_name      = "test"
    }
    pe2 = {
    	  subnet_id                  = "/subscriptions/95537715-aa96-46bc-ab61-a17c5a832d13/resourceGroups/etestrg4251/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"
        is_manual_connection       = "false"
        sa_rg_name                 = "etestrg4251"
        sa_rg_region               = "West Europe"
        subresource_names          = ["blob"]
        pe_name                    = "testpe3"
        storage_entity_map         = "sa3"
        private_dns_zone_ids       = "test"
        private_dns_zone_name      = "test"
    }
    pe3 = {
    	  subnet_id                  = "/subscriptions/95537715-aa96-46bc-ab61-a17c5a832d13/resourceGroups/etestrg4251/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"
        is_manual_connection       = "false"
        sa_rg_name                 = "etestrg4251"
        sa_rg_region               = "West Europe"
        subresource_names          = ["blob"]
        pe_name                    = "testpe2"
        storage_entity_map         = "sa1"
        private_dns_zone_ids       = "test"
        private_dns_zone_name      = "test"
    }
  } 

  
