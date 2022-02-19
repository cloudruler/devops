resource "azurerm_resource_group" "rg_images" {
  name     = "rg-images"
  location = var.location
}

resource "azurerm_shared_image_gallery" "sig" {
  name                = "cloudruler"
  resource_group_name = azurerm_resource_group.rg_images.name
  location            = azurerm_resource_group.rg_images.location
  description         = "Shared Image Gallery for Cloud Ruler"
}

resource "azurerm_shared_image" "si" {
  name                = "aks-control-plane-node"
  gallery_name        = azurerm_shared_image_gallery.sig.name
  resource_group_name = azurerm_resource_group.rg_images.name
  location            = azurerm_resource_group.rg_images.location
  os_type             = "Linux"
  description         = "AKS Control Plane Node"
  hyper_v_generation  = "V2"
  identifier {
    publisher = "Cloud-Ruler"
    offer     = "aks-control-plane-node"
    sku       = "ubuntu-latest"
  }
}
