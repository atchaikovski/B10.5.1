
variable "region" {
  description = "AWS Region to deploy Server in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.small"
}

variable "enable_detailed_monitoring" {
  type    = bool
  default = false
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default = {
    Owner       = "Alex Tchaikovski"
    Project     = "Skill factory HW 10.5.1"
    Purpose     = ""
  }
}

variable "vm_host_name" {
  type = string
  default = "postfix"
}

variable "az" {
  type = string
  default = "us-east-1a"
}

variable "public_key" {}

variable "private_key" {}

variable vm_count {
  type = number
}