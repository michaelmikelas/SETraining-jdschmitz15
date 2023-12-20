variable "port" {
  type        = string
  description = "PCE PORT"
}
variable "pce_url" {
  type        = string
  description = "server and domain name of PCE - https not required"
}
variable "api_user" {
  type = string
}
variable "api_secret" {
  type = string
}
variable "org" {
  type = number
}
