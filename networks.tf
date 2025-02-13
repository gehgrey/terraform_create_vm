  resource "libvirt_network" "network" {
     name      = "debian_test"
     addresses = ["192.168.123.0/24"]
     autostart = true
 
     dhcp {
       enabled = true
     }
     dns {
       enabled = true
     }
   }

