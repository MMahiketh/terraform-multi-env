variable "environment" {
  type = string
}

variable "sg_name" {
  type    = string
  default = "allow_ssh"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "servers" {
  type = map(string)
}