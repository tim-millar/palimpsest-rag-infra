variable "private_key_path" {
  type        = string
  description = "Path to your SSH private key for connecting to the instance"
  default     = "~/.ssh/id_ed25519_lambdalabs_key"
}
