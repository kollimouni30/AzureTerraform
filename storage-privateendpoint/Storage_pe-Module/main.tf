############################
# Create the Storage Account
############################

resource "azurerm_storage_account" "main" {
  for_each                  = var.storage_entity
  name                      = each.value["sa_name"] #name can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long ex-appacrnymenvpurposesa
  resource_group_name       = each.value["sa_rg_name"]
  location                  = each.value["sa_rg_region"]
  account_tier              = each.value["sa_tier"]
  access_tier               = each.value["sa_access_tier"]
  account_replication_type  = each.value["sa_replication_type"]
  account_kind              = each.value["sa_kind"]
  is_hns_enabled            = each.value["is_hns_enabled"]
  enable_https_traffic_only = each.value["enable_https_traffic_only"] 
  tags                      = var.tags
}

############################
# Create the Blob Container
############################
resource "azurerm_storage_container" "main" {
  for_each              = var.containers
  name                  = each.value["name"]
  storage_account_name  = each.value["sa_name"]
  container_access_type = each.value["access_type"]
  depends_on           = [azurerm_storage_account.main]
}

###########################
#Storage Firewall
###########################
resource "azurerm_storage_account_network_rules" "main" {
  for_each             = var.storage_entity
  resource_group_name  = each.value["sa_rg_name"]
  storage_account_name = each.value["sa_name"]
  default_action       = "Deny"
  virtual_network_subnet_ids = each.value["allowed_subnet"]
  depends_on           = [azurerm_storage_account.main]
}

################################
# Creates a new Private Endpoint
################################

resource "azurerm_private_endpoint" "pe_blob" {
  for_each            = var.pe_entity
  name                = each.value["pe_name"]
  location            = each.value["sa_rg_region"]
  resource_group_name = each.value["sa_rg_name"]
  subnet_id           = each.value["subnet_id"]
  depends_on          = [azurerm_storage_account.main]
  private_service_connection {
    name                           = format(
    "%s-peconn",
    each.value["pe_name"]
  )
    is_manual_connection           = each.value["is_manual_connection"]
    private_connection_resource_id = azurerm_storage_account.main[each.value["storage_entity_map"]].id
    subresource_names              = each.value["subresource_names"]
  }
  
  private_dns_zone_group {
    name                 = var.private_dns_zone.name
    private_dns_zone_ids = [var.private_dns_zone.id]
  }
  
}
