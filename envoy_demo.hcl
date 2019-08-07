services {
  name = "client"
  port = 8000
  address = "10.24.0.18"
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
  address = "10.24.0.12"
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
  address = "10.24.0.13"
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
  address = "10.24.0.14"
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
services {
  name = "dogs-2"
  port = 8080
  address = "10.24.0.15"
  connect {
    sidecar_service {
      port = 21004
      checks = [
        {
           name = "Connect Sidecar Listening dogs-2"
           tcp = "picture-service-dogs-2:21004"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing dogs-2"
           alias_service = "dogs-2"
        }
      ]
    }
  }
}
services {
  name = "cats-2"
  port = 8080
  address = "10.24.0.16"
  connect {
    sidecar_service {
      port = 21005
      checks = [
        {
           name = "Connect Sidecar Listening cats-2"
           tcp = "picture-service-cats-2:21005"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing cats-2"
           alias_service = "cats-2"
        }
      ]
    }
  }
}
services {
  name = "rabbits-2"
  port = 8080
  address = "10.24.0.17"
  connect {
    sidecar_service {
      port = 21006
      checks = [
        {
           name = "Connect Sidecar Listening rabbits-2"
           tcp = "picture-service-rabbits-2:21006"
           interval = "10s"
        },
        {
           name = "Connect Sidecar Aliasing rabbits-2"
           alias_service = "rabbits-2"
        }
      ]
    }
  }
}
connect {
  enabled = true
}
