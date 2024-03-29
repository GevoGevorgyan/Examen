variable "vpc_id" {
  type = string
  default = "vpc-04fc897b56b5278d0"
}

variable "key_pair_name" {
  type = string
  default = "gg-key-us-west-2"
}

variable "image_id" {
  type = string
  default = "ami-0a70b9d193ae8a799"
}

variable "subnet_ids" {
  type = list(string)
  default = [ "subnet-0d696561557da3b40", "subnet-0cd4fcbe39fb17e56", "subnet-09d0cf2be58c56e18" ]
}

variable "route53_zone_id" {
  type = string
  default = "Z10299161M47DBD68JOWT"
}