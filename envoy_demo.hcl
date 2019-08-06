services {
  name = "client"
  port = 42400 
  connect {
    sidecar_service {
      proxy {
        upstreams {
          destination_name = "picture-service"
          local_bind_port = 8080
        }
      }
    }
  }
}
services {
  name = "picture-service"
  port = 8080
  connect {
    sidecar_service {}
  }
}
