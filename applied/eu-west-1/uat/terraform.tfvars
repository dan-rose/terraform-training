terragrunt = {
  terraform {
    source = "/home/drose/Documents/git-workspace/aws-terraform/terraform-training/web-tier"
  }
}

instance_type = "t2.small"
instance_count = 3