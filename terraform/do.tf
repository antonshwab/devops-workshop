# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
  image = "ubuntu-18-04-x64"
  name = "devopsanton"
  region = "nyc1"
  size = "s-1vcpu-1gb"
}
