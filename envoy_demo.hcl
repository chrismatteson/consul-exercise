services {
  name = "client"
  port = 8000
  connect {
    sidecar_service {
      proxy {
        upstreams = [
	  { 
            destination_name = "dogs"
            local_bind_port = 42100
          },
	  { 
            destination_name = "cats"
            local_bind_port = 42200
          },
	  { 
            destination_name = "rabbits"
            local_bind_port = 42400
          }
        ]
      }
    }
  }
}
services {
  name = "dogs"
  port = 8080
  connect {
    sidecar_service {}
  }
}
services {
  name = "cats"
  port = 8080
  connect {
    sidecar_service {}
  }
}
services {
  name = "rabbits"
  port = 8080
  connect {
    sidecar_service {}
  }
}
connect {
  enabled = true
}
