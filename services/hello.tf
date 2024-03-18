variable "who" {
  type = string
  default = "World"
}

resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "echo 'Hello ${var.who}'"
  }
}