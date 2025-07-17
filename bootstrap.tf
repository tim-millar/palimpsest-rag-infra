resource "null_resource" "bootstrap" {
  depends_on = [lambdalabs_instance.poc_gpu]

  connection {
    host        = lambdalabs_instance.poc_gpu.ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = trimspace(file(var.private_key_path))
  }

  # 1) Upload and template the bootstrap script
  provisioner "file" {
    content     = templatefile("${path.module}/bootstrap.sh.tpl", { hf_token = local.hf_token })
    destination = "/home/ubuntu/bootstrap.sh"
  }

  # 2) Run only two inline commands: make it executable & execute it
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/bootstrap.sh",
      "/home/ubuntu/bootstrap.sh"
    ]
  }
}
