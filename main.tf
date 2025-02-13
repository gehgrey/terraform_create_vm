# Определяем источник образа
   locals {
     image_path = "/home/brahms/Source/terraform_debian/debina_img.qcow2"
   }

#variable "vm_count" {
#  description = "Number of virtual machines to create"
#  type        = number
#  default     = 4
#}

#variable "img_format" {
#  description = "QCow2 UEFI/GPT Bootable disk image"
#  default = "qcow2"
#  type = string
#}


 resource "libvirt_pool" "pool" {
     name = "four_mashines"
     type = "dir"
     path = "/home/brahms/Source/terraform_4/images"
   }


resource "libvirt_volume" "volumes" {
  for_each = toset([for i in range(var.vm_count) : format("vm-%02d", i + 1)])
  name    = "${each.key}.${var.img_format}"
  pool    = libvirt_pool.pool.name
  source  = local.image_path
  format  = var.img_format
}


#resource "libvirt_domain" "guest" {
#  for_each = toset([for i in range(var.vm_count) : format("vm-%02d", i + 1)])
#  name    = each.key
#  memory  = "1024"
#  vcpu    = 1

#  disk {
#    volume_id = libvirt_volume.volumes[each.key].id
#  }

# network_interface {
#       network_name = libvirt_network.network.name
#       wait_for_lease = true
#     }

# console {
#       type        = "pty"
#       target_port = "0"
#       target_type = "serial"
#     }

#     graphics {
#       type = "spice"
#       listen_type = "address"
#       autoport = true
#     }
#}
 
#output "node_info" {
#  value = {
#    for name, vm in libvirt_domain.guest : name => {
#      name         = vm.name
#      ip_address   = vm.network_interface[0].addresses[0]
#    }
#  }
#}

 
