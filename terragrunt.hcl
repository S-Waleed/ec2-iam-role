remote_state {
  backend = "s3"
  config = {
    bucket  = "some-bucket-terraform-state"
    key     = "${path_relative_to_include()}/ec2/iam-role/terraform.tfstate"
    region  = local.local_inputs.aws_region,
    profile = local.local_inputs.aws_cli_profile
    encrypt = true
  }
}

locals {
  local_inputs  = yamldecode(file("${get_terragrunt_dir()}/inputs.yml"))
  global_inputs = yamldecode(file("${get_terragrunt_dir()}/inputs.yml"))
}

inputs = merge(local.global_inputs, local.local_inputs)
