# creating the vpc 
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    "Name" = "${var.environment}-${var.vpc_name}"
  }
}

# subnets Public
resource "aws_subnet" "vpc_public_subnets" {
  count = length(var.vpc_availability_zones)

  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = element(var.vpc_public_subnets, count.index)
  availability_zone       = element(var.vpc_availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnets-${count.index + 1}"
  }
}

# subnets Private
resource "aws_subnet" "vpc_private_subnets" {
  count = length(var.vpc_availability_zones)

  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = element(var.vpc_private_subnets, count.index)
  availability_zone = element(var.vpc_availability_zones, count.index)

  tags = {
    Name = "${var.environment}-private-subnets-${count.index + 1}"
  }
}

# subnets Database
resource "aws_subnet" "vpc_database_subnets" {
  count = length(var.vpc_availability_zones)

  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = element(var.vpc_database_subnets, count.index)
  availability_zone = element(var.vpc_availability_zones, count.index)

  tags = {
    Name = "${var.environment}-database-subnets-${count.index + 1}"
  }
}

#igw and vpc 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

#eip for nat
resource "aws_eip" "natIp" {
  vpc = true

  tags = {
    Name = "${var.environment}-natIp"
  }
}

#nat in the public_subnet 
resource "aws_nat_gateway" "natGw" {
  allocation_id = aws_eip.natIp.id
  subnet_id     = aws_subnet.vpc_public_subnets[0].id
  tags = {
    Name = "${var.environment}-natGw"
  }
}

#route table Public
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.environment}-public-route"
  }
}

#route table Private
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGw.id
  }
  tags = {
    Name = "${var.environment}-private-route"
  }
}

#route table Database
resource "aws_route_table" "database_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGw.id
  }
  tags = {
    Name = "${var.environment}-database-route"
  }
}


#association of route tables

resource "aws_route_table_association" "public_subassocation" {
  count          = length(var.vpc_public_subnets)
  subnet_id      = element(aws_subnet.vpc_public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_subassocation_A" {
  count          = length(var.vpc_private_subnets)
  subnet_id      = element(aws_subnet.vpc_private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "private_subassocation_B" {
  count          = length(var.vpc_database_subnets)
  subnet_id      = element(aws_subnet.vpc_database_subnets.*.id, count.index)
  route_table_id = aws_route_table.database_route.id
}