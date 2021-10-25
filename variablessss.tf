variable "resource_group_name" {
  type        = string
  description = "RG name in azure"
}
variable "resource_group_location" {
  type        = string
  description = "RG location name in azure"
}

variable "virtual_network_name" {
  type        = string
  description = "virtual network name in azure"
}

variable "subnet_name" {
  type        = string
  description = "subnet name in azure"
}
variable "network_interface_name" {
  type        = string
  description = "network interface name in azure"
}

variable "virtual_machine_name" {
  type        = string
  description = "virtual machine name in azure"
}
variable "managed_disk_name" {
  type        = string
  description = "managed disk name in azure"
}
