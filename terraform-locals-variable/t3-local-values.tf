#Define local values in terraform

locals {
  owners    = var.owner
  Proj_name = var.Proj_Name
  #name      = "${var.owners}-${var.Proj_name}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners    = local.owners
    Proj_name = local.Proj_name
  }
}