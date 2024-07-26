variable "track_name" {
  description = "The name of the service associated to the metadata."
  type        = string
}

variable "tile_application" {
  description = "The name of your application"
  type        = string
  default     = ""
}

variable "app_lifecycle" {
  description = "The specific environment the service will reside in."
  type        = string
  default     = "sandbox"
}

variable "department_code" {
  description = "The department which manages the service."
  type        = string
  default     = ""
}



