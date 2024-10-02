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
  default = {
    "mysql"    = "t3.micro"
    "backend"  = "t3.micro"
    "frontend" = "t3.micro"
  }
}
