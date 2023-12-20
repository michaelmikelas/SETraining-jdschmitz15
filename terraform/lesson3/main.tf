resource "illumio-core_service" "example" {
  name        = "AAA-Example"
  description = "TCP and UDP Protocol ports"

  service_ports {
    # Illumio uses the IANA protocol numbers to identify the service proto
    proto = "6" # TCP
    port  = "9999"
  }

  service_ports {
    proto = "17" # UDP
    port  = "9999"
  }
}

resource "illumio-core_label" "example" {
  key   = "role"
  value = "Terraform-label"
}

resource "illumio-core_ip_list" "example" {
  name        = "IPL-LOCAL"
  description = "Local addresses"

  ip_ranges {
    # from_ip can be a CIDR range or individual IP
    from_ip     = "192.168.0.0/16"
    description = "Internal network range"
  }

  ip_ranges {
    from_ip     = "127.0.0.1"
    description = "Loopback address"
  }

  fqdns {
    fqdn        = "*.localdomain"
    description = "Default localdomain VBox hostnames"
  }
}

resource "illumio-core_unmanaged_workload" "example" {
  name             = "terraform-umwl"
  hostname         = "terraform-umwl.lab.illum.io"
  public_ip        = "172.22.2.222"
  description      = "terraform workload with terraform label"
  enforcement_mode = "visibility_only"
  online           = true

  interfaces {
    name       = "eth0"
    address    = "172.22.2.222"
    cidr_block = 28
    link_state = "up"
  }
  labels {
    href = illumio-core_label.example.href
  }
}

