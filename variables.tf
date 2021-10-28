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

variable "public_ip_name" {
  type        = string
  description = "public ip name in azure"
}

variable "network_interface_name" {
  type        = string
  description = "network interface name in azure"
}

variable "vm_name" {
  type        = string
  description = "vm name in azure"
}

variable "vm_size" {
  type        = string
  description = "vm size in azure"
}

variable "os_disk" {
  type        = string
  description = "os disk in azure"
}

variable "computer_name" {
  type        = string
  description = "computer name in azure"
}

variable "admin_username" {
  type        = string
  description = "admin username in azure"
}

variable "admin_password" {
  type        = string
  description = "admin password in azure"
}

