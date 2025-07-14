resource "lambdalabs_ssh_key" "primary" {
  name = "terraform-key"
}

resource "lambdalabs_instance" "poc_gpu" {
  region_name        = "us-west-1"
  instance_type_name = "gpu_1x_a10"
  ssh_key_names      = [lambdalabs_ssh_key.primary.name]
}
