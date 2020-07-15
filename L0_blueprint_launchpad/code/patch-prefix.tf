# Define variables used by profile
variable "env" {}
variable "group" {}
variable "project" {}

# Compute local prefix from variables
locals {
  prefix = "${var.env}-${var.group}_${var.project}"
}