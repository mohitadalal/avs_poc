#RESOURCE GROUP
resource_group_variables = {
  "resource_group_1" = {
    resource_group_name       = "PNC-POC-RG" #(Required) Name of the Resource Group with which it should be created.
    resource_group_location   = "eastus"     #(Required) The Azure Region where the Resource Group should exist.
    resource_group_managed_by = "PNC"        #(optional)  The ID of the resource or application that manages this Resource Group.
    resource_group_tags = {                  #(Optional) A mapping of tags which should be assigned to the Resource Group.
      Owner       = "gowtham.nara@neudesic.com",
      Environment = "POC",
    }
  }
}