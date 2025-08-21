module "ecr" {
  source = "./modules/01_ecr"
  name   = var.name
}
