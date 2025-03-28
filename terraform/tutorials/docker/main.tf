terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # 连接远程 Docker 守护进程
  host = "tcp://your-remote-docker-host:2375"  # 替换为实际 IP 或域名

  # 如果启用 TLS 认证（推荐），需添加以下参数
  # ca_cert   = file("~/.docker/ca.pem")
  # cert      = file("~/.docker/cert.pem")
  # key       = file("~/.docker/key.pem")
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false  # 镜像仅保存在远程主机
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial-remote"

  ports {
    internal = 80
    external = 8000  # 映射到远程主机的 8000 端口
  }
}