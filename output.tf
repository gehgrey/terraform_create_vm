output "node_info" {
  value = {
    for name, vm in libvirt_domain.guest : name => {
      name         = vm.name
      ip_address   = vm.network_interface[0].addresses[0]
    }
  }
}

