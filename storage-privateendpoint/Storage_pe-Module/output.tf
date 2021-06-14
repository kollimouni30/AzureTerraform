output "pe_id" {
    value = [for v in azurerm_private_endpoint.pe_blob:{
        name = v.name
        id = v.id 
    }]
}

output "storage_id" {
    value = [for u in azurerm_storage_account.main:{
        name = u.name
        id = u.id 
    }]
}
