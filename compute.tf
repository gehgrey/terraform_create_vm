resource "libvirt_domain" "guest" {
  for_each = toset([for i in range(var.vm_count) : format("vm-%02d", i + 1)])
  name    = each.key
  memory  = var.vm_mem
  vcpu    = var.vm_vcpu

  disk {
    volume_id = libvirt_volume.volumes[each.key].id
  }

 network_interface {
       network_name = libvirt_network.network.name
       wait_for_lease = true
     }

 console {
       type        = "pty"
       target_port = "0"
       target_type = "serial"
     }

     graphics {
       type = "spice"
       listen_type = "address"
       autoport = true
     }
}

