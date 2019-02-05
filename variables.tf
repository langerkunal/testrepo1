#####################################################################
##
##      Created 2/5/19 by admin. for cam-project
##
#####################################################################

variable "openstack_user_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_password" {
  type = "string"
  description = "Generated"
}

variable "openstack_project_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_domain_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_auth_url" {
  type = "string"
  description = "Generated"
}

variable "openstack_region" {
  type = "string"
  description = "Generated"
}

variable "Db-VM_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_image_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_flavor_name" {
  type = "string"
  description = "Generated"
}

variable "openstack_key_pair_name" {
  type = "string"
  description = "Generated"
}

variable "App-VM_name" {
  type = "string"
  description = "Generated"
}

variable "Db-VM_connection_user" {
  type = "string"
  default = "root"
}

variable "Db-VM_connection_password" {
  type = "string"
}

variable "Db-VM_connection_host" {
  type = "string"
}

variable "App-VM_connection_user" {
  type = "string"
  default = "root"
}

variable "App-VM_connection_password" {
  type = "string"
}

variable "App-VM_connection_host" {
  type = "string"
}

