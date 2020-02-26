locals {
  service_name        = "txtdata"
  cluster_role        = "app"
  scaling_description = "TTSAvgCPU"
}

provider "random" {
   version = ">= 1.2.0, < 3.0.0"
}

module "this" {
  source = "../../"

  name_prefix   = "${local.service_name}-${local.cluster_role}-${local.scaling_description}"
  resource_type = "autoscaling_policy"

  keepers = {
    FirstKeeper  = "TestValue"
    SecondKeeper = "TestValue2"
  }
}
