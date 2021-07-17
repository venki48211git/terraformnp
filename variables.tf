variable "rg" {
default = "terraform-lab2"
}

variable "server_port" {
description = "The port the server will use for HTTP requests"
type = number
default = 8080
}
variable "number_example" {
description = "An example of a number variable in Terraform"
type = number
default = 42
}

variable "sg_desc" {
  default = "Terraform_SG_desc"
}
