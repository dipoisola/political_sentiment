variable "db-uri" {
  default = ""
}

module "db" {
  source = "./db"
  db-uri = "${var.db-uri}"
}