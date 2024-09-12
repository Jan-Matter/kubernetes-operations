# Create the control-server
resource "hcloud_server" "jump-server" {
  name        = "jump-server"
  image       = "ubuntu-24.04"
  server_type = "cx32"
  datacenter  = "nbg1-dc3"
  ssh_keys    = ["MAIN SSH KEY"]
  public_net  {
    ipv4_enabled = true
    ipv6_enabled = true
  }


  network {
    network_id = hcloud_network.kubernetes-node-network.id
    ip         = "10.0.0.2"
  }

  depends_on = [
    hcloud_network_subnet.kubernetes-node-subnet
  ]

}

# Create the node network
resource "hcloud_network" "kubernetes-node-network" {
  name     = "kubernetes-node-network"
  ip_range = "10.0.0.0/16"
}

# Store the network ID in a local value
locals {
  network_id = hcloud_network.kubernetes-node-network.id
}


# Create the kubernetes nodes
resource "hcloud_server" "kube-node" {
  count       = 3
  name        = "kube-node-${count.index + 1}"
  image       = "ubuntu-24.04"
  server_type = "cx32"
  datacenter  = "nbg1-dc3"
  ssh_keys    = ["MAIN SSH KEY"]
  public_net  {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  network {
    network_id = local.network_id
    ip         = "10.0.0.${count.index + 3}"
  }

  depends_on = [
    hcloud_network_subnet.kubernetes-node-subnet
  ]
}

# Create the node subnet
resource "hcloud_network_subnet" "kubernetes-node-subnet" {
  type         = "cloud"
  network_id   = local.network_id
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/16"
}


# Create an ssh-key
resource "hcloud_ssh_key" "default" {
  name       = "MAIN SSH KEY"
  public_key = "${var.MAIN_SSH_KEY}"
}

# Create the jump-server ssh-key
#resource "hcloud_ssh_key" "jump_server" {
#  name       = "JUMP SERVER SSH KEY"
#  public_key = "${var.JUMP_SERVER_SSH_KEY}"
#}