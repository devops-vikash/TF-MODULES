variable zone {
  type        = string
  default     = "europe-west4-a"
  description = "description"
}

variable "region" {
  type        = string
  default     = "europe-west4"
  description = "description"
}

variable "project_id" {
  type        = string
  default     = "kb-chatbot-test"
  description = "description"
}

variable ip_cidr_range-west {
  type        = string
  default     = "10.0.0.0/24"
  description = "description"
}

variable machine_type {
  type        = string
  default     = "n1-standard-1"
  description = "description"
}
