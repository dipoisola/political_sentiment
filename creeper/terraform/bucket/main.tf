variable "name" {
  type = "string"
}

variable "tags" {
  type = "map"
}


resource "aws_s3_bucket" "bucket" {
  bucket = "${var.name}"
  acl = "private"

  tags = "${var.tags}"
}

output "name" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "arn" {
  value = "${aws_s3_bucket.bucket.arn}"
}

