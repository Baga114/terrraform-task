# Configure the Kubernetes provider
provider "kubernetes" {
  config_context_cluster = "eks-cluster"
}
# Create a Kubernetes namespace
resource "kubernetes_namespace" "nginx" {
  metadata {
    name = "nginx"
  }
}
# Create a Kubernetes deployment for Nginx
resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.nginx.metadata[0].name
    labels = {
      app = "nginx"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    replicas = 1

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"

          volume_mount {
            name       = "nginx-volume"
            mount_path = "/usr/share/nginx/html"
          }
        }

        volume {
          name = "nginx-volume"

          config_map {
            name = kubernetes_config_map.nginx.metadata[0].name
          }
        }
      }
    }
  }
}

# Create a Kubernetes ConfigMap for Nginx
resource "kubernetes_config_map" "nginx" {
  metadata {
    name      = "nginx-config"
    namespace = kubernetes_namespace.nginx.metadata[0].name
  }

  data = {
    "test1.htm" = <<-EOT
      <html>
      <head>
        <title>Test Page</title>
      </head>
      <body>
        <h1>This is a test page served by Nginx on EKS.</h1>
      </body>
      </html>
    EOT
  }
}

# Create a Kubernetes service for Nginx
resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.nginx.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      name       = "http"
      port       = 80
      target_port = 80
    }
  }
}

# Create a Kubernetes Ingress resource for Nginx
resource "kubernetes_ingress" "nginx" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.nginx.metadata[0].name

    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/nginx"
          backend {
            service_name = kubernetes_service.nginx.metadata[0].name
            service_port = kubernetes_service.nginx.spec[0].port[0].port
          }
        }
      }
    }
  }
} 
