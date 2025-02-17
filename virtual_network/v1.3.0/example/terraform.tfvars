#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    resource_group_name       = "ploceusrg000005" #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = "eastus"          #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = "ploceus"         #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags = {                       #(Optional) A mapping of tags which should be assigned to the Resource Group.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#NETWORK SECURITY GROUP
network_security_group_variables = {
  "network_security_group_1" = {
    network_security_group_name                = "ploceusnsg000001" # (Required) Specifies the name of the network security group
    network_security_group_resource_group_name = "ploceusrg000005"  # (Required) The name of the resource group in which to create the network security group
    network_security_group_location            = "eastus"           # (Required) Specifies the supported Azure location where the resource exists
    network_security_group_security_rule = {                        # (Optional) Map of objects representing security rules
      "nsg_rule_01" = {
        security_rule_name                                           = "ploceusnsgrule000001" # (Required) The name of the security rule
        security_rule_application_security_group_resource_group_name = null                   # (Optional) The resource group name of the application security group
        security_rule_priority                                       = 100                    # (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.
        security_rule_direction                                      = "Inbound"              # (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.
        security_rule_access                                         = "Allow"                # (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.
        security_rule_protocol                                       = "Tcp"                  # (Required) Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all).
        security_rule_source_port_range                              = "*"                    # (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified
        security_rule_source_port_ranges                             = null                   # (Optional) List of source ports or port ranges. This is required if source_port_range is not specified
        security_rule_destination_port_range                         = "*"                    # (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.
        security_rule_destination_port_ranges                        = null                   # (Optional) List of destination ports or port ranges. This is required if destination_port_range is not specified
        security_rule_source_address_prefix                          = "*"                    # (Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified.
        security_rule_source_address_prefixes                        = null                   # (Optional) List of source address prefixes. Tags may not be used. This is required if source_address_prefix is not specified.
        security_rule_destination_address_prefix                     = "*"                    # (Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified.
        security_rule_destination_address_prefixes                   = null                   # (Optional) List of destination address prefixes. Tags may not be used. This is required if destination_address_prefix is not specified.
        security_rule_description                                    = "InboundAllow100"      # (Optional) A description for this rule. Restricted to 140 characters
        security_rule_source_application_security_group_names        = null                   # (Optional) A List of source Application Security Group names
        security_rule_destination_application_security_group_names   = null                   # (Optional) A List of destination Application Security Group names
    } }
    network_security_group_tags = { #(Optional) A mapping of tags which should be assigned to the Network Security Group.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VIRTUAL NETWORK 
virtual_network_variables = {
  "virtual_network_1" = {
    virtual_network_name                    = "ploceusvnet000001"         #(Required) The name of the virtual network.
    virtual_network_location                = "eastus"                    #(Required) The location/region where the virtual network is created.
    virtual_network_resource_group_name     = "ploceusrg000005"           #(Required) The name of the resource group in which to create the virtual network.
    virtual_network_address_space           = ["10.0.0.0/16"]             #(Required) The address space that is used the virtual network.
    virtual_network_dns_servers             = null                        #(Optional) List of IP addresses of DNS servers.Since dns_servers can be configured both inline and via the separate azurerm_virtual_network_dns_servers resource, we have to explicitly set it to empty slice ([]) to remove it.
    virtual_network_flow_timeout_in_minutes = null                        #(Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes.
    virtual_network_bgp_community           = null                        #(Optional) The BGP community attribute in format <as-number>:<community-value>.The as-number segment is the Microsoft ASN, which is always 12076 for now.
    virtual_network_edge_zone               = null                        #(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    virtual_network_ddos_protection_plan = {                              #(Optional block) provide true for virtual_network_ddos_protection_enable incase ddos_protection needs to be enabled.
      virtual_network_ddos_protection_enable    = false                   #(Required) Enable/disable DDoS Protection Plan on Virtual Network.
      virtual_network_ddos_protection_plan_name = "ploceusddosplan000001" #(Required) Needed for ddos protection plan id.Provide the name of the ddos protection plan if above enable is true
    }
    virtual_network_encryption = [
      {
        virtual_network_encryption_enforcement = "AllowUnencrypted"
      }
    ]
    virtual_network_subnet = [ #(Optional) Can be specified multiple times to define multiple subnets
      {
        virtual_network_subnet_name                                       = "ploceussubnet000001" #(Optional) Can be specified multiple times to define multiple subnets
        virtual_network_subnet_address_prefix                             = "10.0.0.0/24"         #(Required) The address prefix to use for the subnet.
        virtual_network_subnet_network_security_group_name                = "ploceusnsg000001"    #(Optional) The Network Security Group to associate with the subnet.
        virtual_network_subnet_network_security_group_resource_group_name = "ploceusrg000005"     #(Optional) The Network Security Group to associate with the subnet.
      },
      {
        virtual_network_subnet_name                                       = "ploceussubnet000002" #(Optional) Can be specified multiple times to define multiple subnets
        virtual_network_subnet_address_prefix                             = "10.0.1.0/24"         #(Required) The address prefix to use for the subnet.
        virtual_network_subnet_network_security_group_name                = null                  #(Optional) The Network Security Group to associate with the subnet.
        virtual_network_subnet_network_security_group_resource_group_name = null                  #(Optional) The Network Security Group to associate with the subnet.
      }
    ]
    virtual_network_tags = { #(Optional) A mapping of tags which should be assigned to the virtual network.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "virtual_network_2" = {
    virtual_network_name                    = "ploceusvnet000002"         #(Required) The name of the virtual network.
    virtual_network_location                = "eastus"                    #(Required) The location/region where the virtual network is created.
    virtual_network_resource_group_name     = "ploceusrg000005"           #(Required) The name of the resource group in which to create the virtual network.
    virtual_network_address_space           = ["11.0.0.0/16"]             #(Required) The address space that is used the virtual network.
    virtual_network_dns_servers             = null                        #(Optional) List of IP addresses of DNS servers
    virtual_network_flow_timeout_in_minutes = null                        #(Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes.
    virtual_network_bgp_community           = null                        #(Optional) The BGP community attribute in format <as-number>:<community-value>.
    virtual_network_edge_zone               = null                        #(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    virtual_network_ddos_protection_plan = {                              #(Optional block) Provide virtual_network_ddos_protection_enable as true if needed ddos protection
      virtual_network_ddos_protection_enable    = false                   #(Required) Enable/disable DDoS Protection Plan on Virtual Network.
      virtual_network_ddos_protection_plan_name = "ploceusddosplan000001" #(Required) Needed for ddos protection plan id.Provide the name of the ddos protection plan if above enable is true
    }
    virtual_network_encryption = [
      {
        virtual_network_encryption_enforcement = "AllowUnencrypted"
      }
    ]
    virtual_network_subnet = null #(Optional) Can be specified multiple times to define multiple subnets
    virtual_network_tags = {      #(Optional) A mapping of tags which should be assigned to the virtual network.
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#DDOS plan creation is optional and costly. Uncommenting  will create a new DDOS protection plan. Use only if required. 
/* network_ddos_protection_plan_variables = {
   "ddos_plan_1" = {
     network_ddos_protection_plan_name                = "ploceusddosplan000001" #(Required) Specifies the name of the Network DDoS Protection Plan. 
     network_ddos_protection_plan_location            = "eastus"               #(Required) The name of the resource group in which to create the resource.
     network_ddos_protection_plan_resource_group_name = "ploceusrg000005"       #(Required) Specifies the supported Azure location where the resource exists.
     #(Optional) A mapping of tags which should be assigned to the DDOS protection plan
     network_ddos_protection_plan_tags = {
       Created_By = "Ploceus",
       Department = "CIS"
    }
   }
 } */