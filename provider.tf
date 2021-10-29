# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features { }
  client_secret = "VqR7Q~3h2te6_OHvycqJTnWwlRzUPEyUdUiFM"
  client_id = "8fa94142-b67c-4086-a0d6-78fe92b1e5f4"
  tenant_id = "eeeb6497-738c-49c7-b0cd-68cd0669e13d"
  subscription_id = "a680f040-a5db-4a85-b40f-61bf75c5aa4c"
}
