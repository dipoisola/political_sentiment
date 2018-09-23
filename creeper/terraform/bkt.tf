module "bkt" {
  source = "./bucket"
  name   = "creeper-bank"

  tags = {
    Name        = "Creeper"
    Description = "Storage bank for tweets"
  }
}
