variable "twitter-oauth-param-tags" {
    type = "map"
    default = {
        Name = "Creeper"
        Description = "Twitter OAuth Credentials."
    }
}

variable "twitter-oauth-token" {
   default = ""
}
module "token_param" {
  source = "./ssm"
  name = "/creeper/twitter-token"
  value = "${var.twitter-oauth-token}"
  tags = "${var.twitter-oauth-param-tags}"
}

variable "twitter-oauth-token-secret" {
   default = ""
}
module "token-secret_param" {
  source = "./ssm"
  name = "/creeper/twitter-oauth-token-secret"
  value = "${var.twitter-oauth-token-secret}"
  tags = "${var.twitter-oauth-param-tags}"
}

variable "twitter-oauth-consumer-key" {
   default = ""
}
module "consumer-key_param" {
  source = "./ssm"
  name = "/creeper/twitter-oauth-consumer-key"
  value = "${var.twitter-oauth-consumer-key}"
  tags = "${var.twitter-oauth-param-tags}"
}

variable "twitter-oauth-consumer-secret" {
   default = ""
}
module "consumer-secret_param" {
  source = "./ssm"
  name = "/creeper/twitter-oauth-consumer-secret"
  value = "${var.twitter-oauth-consumer-secret}"
  tags = "${var.twitter-oauth-param-tags}"
}

