
module "Storage_pe-Module" {
  source = "../Storage_pe-Module"
  storage_entity           = var.storage_entity
  pe_entity                = var.pe_entity
  tags                     = var.tags
  shares                   = var.shares
  containers               = var.containers
} 

