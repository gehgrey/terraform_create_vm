variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 5
}

variable "vm_vcpu" {
  description = "Number of virtual cpu  on vm"
  type        = number
  default     = 1
}

variable "vm_mem" {
  description = "ram"
  default = 1024
  type = number
}






variable "img_format" {
  description = "QCow2 UEFI/GPT Bootable disk image"
  default = "qcow2"
  type = string
}

