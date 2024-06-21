variable "vpc_id" {
  description = "VPC ID"
}

variable "db_subnet_group" {
  description = "DB Subnet Group"
}

variable "security_group_id" {
  description = "Security Group ID"
}

variable "db_username" {
  description = "Database Username"
  default     = "admin"
}

variable "db_password" {
  description = "Database Password"
}
