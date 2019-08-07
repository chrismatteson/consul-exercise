services {
  name = "client"
  port = 8000
  address = "10.24.0.105"
  connect {
    sidecar_service {
      port = 21000
      checks = [
        {
           name = "Connect Sidecar Listening client"
           tcp = "consul-demo-gateway:21000"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing client"
           alias_service = "client"
        }
      ]
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
  address = "10.24.0.102"
  connect {
    sidecar_service {
      port = 21001
      checks = [
        {
           name = "Connect Sidecar Listening dogs"
           tcp = "picture-service-dogs:21001"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing dogs"
           alias_service = "dogs"
        }
      ]
    }
  }
}
services {
  name = "cats"
  port = 8080
  address = "10.24.0.103"
  connect {
    sidecar_service {
      port = 21002
      checks = [
        {
           name = "Connect Sidecar Listening cats"
           tcp = "picture-service-cats:21002"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing cats"
           alias_service = "cats"
        }
      ]
    }
  }
}
services {
  name = "rabbits"
  port = 8080
  address = "10.24.0.104"
  connect {
    sidecar_service {
      port = 21003
      checks = [
        {
           name = "Connect Sidecar Listening rabbits"
           tcp = "picture-service-rabbits:21003"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing rabbits"
           alias_service = "rabbits"
        }
      ]
    }
  }
}
connect {
  enabled = true
}
