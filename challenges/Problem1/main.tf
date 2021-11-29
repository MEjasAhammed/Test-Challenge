resource "aws_vpc" "vpcname" {
    cidr_block = var.vpc_cdir_block

    tags = {
        Name = "VPC Name"
    }
}

resource "aws_subnet" "publicsubnet" {
    
    vpc_id            = aws_vpc.vpcname.id
    cidr_block        = var.public_subnet
    availability_zone = var.availability_zone
  
}

resource "aws_internet_gateway" "gw" {
        vpc_id = aws_vpc.vpcname.id

}

resource "aws_route_table" "public" {

    vpc_id = aws_vpc.vpcname.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
  
}

resource "aws_route_table_association" "public" {

    subnet_id = aws_subnet.publicsubnet.id
    route_table_id = aws_route_table.public.id

}

resource "aws_instance" "instance1" {

    ami                         = var.amis
    instance_type               = var.instance_type
    subnet_id                   =  aws_subnet.publicsubnet.id
    key_name                    = "keyname"

  
}

resource "aws_instance" "instance2" {

    ami                         = var.amis
    instance_type               = var.instance_type
    subnet_id                   =  aws_subnet.publicsubnet.id
    key_name                    = "keyname"

  
}

resource "aws_db_instance" "rdsInstance" {

    allocated_storage               = 30
    storage_type                    = "gp2"
    engine                          = "mysql"
    engine_version                  = "5.7.34"
    instance_class                  = "db.t3.medium"
    name                            = "mrds"
    username                        = "admin"
    password                        = "admin"
  
}

