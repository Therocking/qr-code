resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    "Name" = "Qr_Code-VPC"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone = var.availability-zone1

  tags = {
    "Name" = "Qr-Code_Subnet1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.16.0/20"
  map_public_ip_on_launch = true
  availability_zone = var.availability-zone2

  tags = {
    "Name" = "Qr-Code_Subnet2"
  }
}

resource "aws_subnet" "subnet-3" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.32.0/20"
  map_public_ip_on_launch = true
  availability_zone = var.availability-zone3

  tags = {
    "Name" = "Qr-Code_Subnet3"
  }
}

resource "aws_internet_gateway" "internet-gw" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = "Qr-Code_Internet-GW"
    }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    "Name" = "Qr_Code-RT"
  }
}

resource "aws_route_table_association" "subnet1-assosiation" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "subnet2-assosiation" {
  subnet_id = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "subnet3-assosiation" {
  subnet_id = aws_subnet.subnet-3.id
  route_table_id = aws_route_table.route-table.id
}