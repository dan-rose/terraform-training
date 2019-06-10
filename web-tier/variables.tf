provider "aws" {
  region = "eu-west-1"
}

variable "webtier-amiID" {
  description = "AMI ID for WebTier"
  default     = "ami-030dbca661d402413"
}

variable "instance_type" {
  type        = "string"
  description = "description"
  default     = "t2.small"
}

variable "tags" {
  type        = "map"
  description = "description"

  default = {
    Name   = "Dans Test Machine"
    Owners = "UK Sandbox"
    Product = "test product"
  }
}

variable "subnet_ids" {
  type = "list"

  default = [
    "subnet-085e0f79ccdd05ae0",
    "subnet-0895982686f925388",
  ]
}


variable "subnet_id" {
  default =   "subnet-085e0f79ccdd05ae0"
}

variable "vpc_id" {
  default = "vpc-0529bf139058743c1"
}

variable "instance_count" {
default = 2
}

