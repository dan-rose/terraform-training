terragrunt = {
  terraform {
    source = "/home/drose/Documents/git-workspace/aws-terraform/terraform-training/web-tier"
  }
}
instance_type = "m4.large"
instance_count = 4