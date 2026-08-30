rgs = {
  rg1 = {
    name     = "ashish-rg2"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "ashish-vnet2"
    location            = "centralindia"
    resource_group_name = "ashish-rg2"
    address_space       = ["10.1.0.0/16"]
  }
}

snets = {
  frontend_snet = {
    name                 = "frontend_subnet"
    resource_group_name  = "ashish-rg2"   # FIXED
    virtual_network_name = "ashish-vnet2" # FIXED (was ashish-vnet1)
    address_prefixes     = ["10.1.1.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "pip3"
    location            = "centralindia" # FIXED (was East US – must be same region as NIC)
    resource_group_name = "ashish-rg2"
    allocation_method   = "Static"
  }
}

nics = {
  nic1 = {
    name                 = "ashish-nic2"
    location             = "centralindia"
    resource_group_name  = "ashish-rg2"
    subnet_name          = "frontend_subnet"
    virtual_network_name = "ashish-vnet2"
  }
}

vms = {
  vm1 = {
    vm_name             = "frontend-ashish-vm1"
    location            = "centralindia"
    resource_group_name = "ashish-rg2"
    size                = "Standard_D2s_v3" # FIXED (Standard_VS2V3 does not exist)
    admin_username      = "ashishadmin"
    admin_password      = "Asak@1234"
    nic_name            = "ashish-nic2"
  }
}


bastion = {
  bastion1 = {
    name                = "ashish-bastion2"
    location            = "centralindia"
    resource_group_name = "ashish-rg2"
    public_ip_name       = "pip3"
    bastion_subnet_name  = "AzureBastionSubnet"
    virtual_network_name = "ashish-vnet2"
    address_prefixes      = ["10.1.0.0/26"]
  }
}

nsgs = {
  frontend_nsg = {
    name                = "frontend-nsg"
    location            = "centralindia"
    resource_group_name = "ashish-rg2"
    subnet_name         =  "frontend_subnet"
    virtual_network_name = "ashish-vnet2"
    resource_group_name  = "ashish-rg2"

    security_rules = {
      allow_ssh = {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      allow_rdp = {
        name                       = "Allow-RDP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      allow_http = {
        name                       = "Allow-HTTP"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      allow_https = {
        name                       = "Allow-HTTPS"
        priority                  = 130
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                  = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}