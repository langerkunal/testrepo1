#####################################################################
##
##      Created 2/5/19 by admin. for cam-project
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "openstack" {
  user_name   = "${var.openstack_user_name}"
  password    = "${var.openstack_password}"
  tenant_name = "${var.openstack_project_name}"
  domain_name = "${var.openstack_domain_name}"
  auth_url    = "${var.openstack_auth_url}"
  region      = "${var.openstack_region}"
  insecure    = true
  version = "~> 1.2"
}


resource "openstack_compute_instance_v2" "Db-VM" {
  name      = "${var.Db-VM_name}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  key_pair  = "${openstack_compute_keypair_v2.auth.id}"
  connection {
    type = "ssh"
    user = "${var.Db-VM_connection_user}"
    password = "${var.Db-VM_connection_password}"
    host = "${var.Db-VM_connection_host}"
  }
  network {
   uuid = "${openstack_networking_network_v2.openstack_network.id}"
  }
}

resource "openstack_compute_instance_v2" "App-VM" {
  name      = "${var.App-VM_name}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  key_pair  = "${openstack_compute_keypair_v2.auth.id}"
  connection {
    type = "ssh"
    user = "${var.App-VM_connection_user}"
    password = "${var.App-VM_connection_password}"
    host = "${var.App-VM_connection_host}"
  }
  network {
    uuid = "${openstack_networking_network_v2.openstack_network.id}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "openstack_compute_keypair_v2" "auth" {
    name = "${var.openstack_key_pair_name}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "openstack_networking_network_v2" "openstack_network" {
  name           = "openstack_network"
  admin_state_up = "true"
}

resource "openstack_blockstorage_volume_v2" "volume" {
  region      = "TODO"
  name        = "volume"
  size        = TODO
}

resource "openstack_blockstorage_volume_v2" "volume1" {
  region      = "TODO"
  name        = "volume1"
  size        = TODO
}

resource "openstack_compute_volume_attach_v2" "Db-VM_volume_volume" {
  instance_id = "${openstack_compute_instance_v2.Db-VM.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.volume.id}"
}

resource "openstack_compute_volume_attach_v2" "App-VM_volume1_volume" {
  instance_id = "${openstack_compute_instance_v2.App-VM.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.volume1.id}"
}
