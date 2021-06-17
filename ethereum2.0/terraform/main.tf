terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.14.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

resource "random_password" "linode_root_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "linode_instance" "ethereum_node" {
  image           = "linode/ubuntu18.04"
  label           = "ethereum-node"
  group           = "terraform"
  region          = "eu-west"
  type            = "g6-standard-1"
  authorized_keys = [chomp(file(var.ssh_public_key_file))]
  root_pass       = "Akvariumas123/"
}

resource "linode_instance" "monitoring_node" {
  image           = "linode/ubuntu18.04"
  label           = "monitoring-node"
  group           = "terraform"
  region          = "eu-west"
  type            = "g6-standard-1"
  authorized_keys = [chomp(file(var.ssh_public_key_file))]
  root_pass       = "Akvariumas123/"
}