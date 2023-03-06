variable "hcloud_token" {
  # default = <your-api-token>
}

variable "location" {
  default = "nbg1"
}

variable "instances" {
  default = "3"
}

variable "server_type" {
  default = "cx21"
}

variable "os_type" {
  default = "rocky-8"
}

variable "disk_size" {
  default = "20"
}

variable "services_protocol" {
  default = "tcp"
}

variable "services_port" {
  default = "6443"
  type = number
}

variable "ip_range" {
  default = "10.0.1.0/24"
}

variable "lb_private_ip" {
  default = "10.0.1.10"
}
