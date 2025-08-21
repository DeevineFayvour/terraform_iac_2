module "alb" {
  source     = "./alb_module"
  alb_sg_id  = module.network.alb_sg_id # ✅ Using the output
}
