variable "db_server" {
  type = map(any)
}

variable "sql_server_map" {
  description = "sqlserver1"
  type        = map(string)
}