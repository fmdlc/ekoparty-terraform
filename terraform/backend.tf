#------------------------------------------------------------------------------
# AWS Backend configuration
#
#------------------------------------------------------------------------------
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "tty0"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "demo-cluster-devsecops"
    }
  }
}
