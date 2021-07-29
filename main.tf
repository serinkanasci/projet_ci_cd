terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.13.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "serinkan/nginx_sample"
}

# Create a container
resource "docker_container" "container" {
  image = "${docker_image.nginx.name}"
  name  = "nginx-terraform"
  ports {
    internal = 80
    external = 8081
  }
}
