locals  {
  greetings = "Hello ${var.who}"
}

resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "echo '${local.greetings}'"
  }
}

output "greetings" {
  value = "${local.greetings}"
}