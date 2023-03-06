resource "hcloud_server" "kube-master" {
  name        = "kube-master${count.index}"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.mykey.id]
  count       = var.instances
  labels = {
    type = "master"
  }
  network {
    network_id = hcloud_network.hc_private.id
  }
  user_data = file("user_data.yml")
  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }
  depends_on = [
    hcloud_network_subnet.hc_private_subnet
  ]
}

resource "hcloud_server" "kube-worker" {
  name        = "kube-worker${count.index}"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.mykey.id]
  count       = var.instances
  labels = {
    type = "worker"
  }
  network {
    network_id = hcloud_network.hc_private.id
  }
  user_data = file("user_data.yml")
  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }
  depends_on = [
    hcloud_network_subnet.hc_private_subnet
  ]
}