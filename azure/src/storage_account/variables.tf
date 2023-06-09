variable "create_resource_group" {
  description = "Whether to create a resource group"
  type        = bool
  default     = true
  nullable    = false
}

variable "environment" {
  description = "Name of the environment"
  type        = string
  default     = "test"
  nullable    = false
}

variable "location" {
  description = "The location/region where the resources are created"
  type        = string
  default     = "westeurope"
  nullable    = false
}

variable "project" {
  description = "Name of the project"
  type        = string
  default     = "project"
  nullable    = false
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = null
}
