terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# This tells Terraform to build an image from your Dockerfile
resource "docker_image" "blog_image" {
  name = "my-local-blog:latest"
  build {
    context = "."
  }
}

# This tells Terraform to start a container using that image
resource "docker_container" "blog_server" {
  image = docker_image.blog_image.image_id
  name  = "my_devops_blog"
  ports {
    internal = 80
    external = 8081
  }
}