variable "vpc_cdir_block" {

    default = "10.0.0.0/16"
  
}

variable "public_subnet" {

    default = "10.0.1.0/24"
  
}

variable "availability_zone" {

    default = "us-east-1a"
  
}

variable "amis" {
    
    default = "ami-0b0af3577fe5e3532"
  
}


variable "instance_type" {

    default = "t2.nano"
  
}
