variable "sg_name" {
  type    = map(any)
  default = {
    prod = "allow_ssh_prod"
    dev = "allow_ssh_dev"
  }
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "servers" {
  type = map(any)
  default = {
    prod = {
      "mysql-prod"    = "t3.micro"
      "backend-prod"  = "t3.micro"
      "frontend-prod" = "t3.micro"
    }
    dev = {
      "mysql-dev"    = "t3.micro"
      "backend-dev"  = "t3.micro"
      "frontend-dev" = "t3.micro"
    } 
  }
}
