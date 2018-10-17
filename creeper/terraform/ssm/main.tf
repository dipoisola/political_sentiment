variable "name" {
  type = "string"
}

variable "value" {
  type = "string"
}

variable "tags" {
  type = "map"
}

data "aws_ssm_parameter" "param" {
  name = "${var.name}"
  count = "${var.value == "" ? 1 : 0}"
}

resource "aws_ssm_parameter" "param" {
  name = "${var.name}"
  type = "SecureString"
  value = "${var.value}"
  overwrite = true
  count = "${var.value != "" ? 1 : 0}"
  tags = "${var.tags}"
}

output "name" {
  value = "${var.name}"
}

output "value" {
  value = "${var.value == "" ? element(concat(data.aws_ssm_parameter.param.*.value, list("")), 0) : var.value}"
}

