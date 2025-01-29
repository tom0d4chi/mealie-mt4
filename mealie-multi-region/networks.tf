# ==============================
# 🔹 VPC - Réseaux pour chaque région
# ==============================
resource "aws_vpc" "mealie_vpc_france" {
  provider   = aws.france
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Mealie-VPC-France"
  }
}

resource "aws_vpc" "mealie_vpc_allemagne" {
  provider   = aws.allemagne
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "Mealie-VPC-Allemagne"
  }
}

# ==============================
# 🔹 Subnets pour les instances EC2
# ==============================
resource "aws_subnet" "mealie_subnet_france" {
  provider          = aws.france
  vpc_id            = aws_vpc.mealie_vpc_france.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Mealie-Subnet-France"
  }
}

resource "aws_subnet" "mealie_subnet_allemagne" {
  provider          = aws.allemagne
  vpc_id            = aws_vpc.mealie_vpc_allemagne.id
  cidr_block        = "10.1.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Mealie-Subnet-Allemagne"
  }
}

# ==============================
# 🔹 Internet Gateway pour accès public
# ==============================
resource "aws_internet_gateway" "mealie_igw_france" {
  provider = aws.france
  vpc_id   = aws_vpc.mealie_vpc_france.id

  tags = {
    Name = "Mealie-IGW-France"
  }
}

resource "aws_internet_gateway" "mealie_igw_allemagne" {
  provider = aws.allemagne
  vpc_id   = aws_vpc.mealie_vpc_allemagne.id

  tags = {
    Name = "Mealie-IGW-Allemagne"
  }
}

# ==============================
# 🔹 Route Table pour acheminer le trafic via l'Internet Gateway
# ==============================
resource "aws_route_table" "mealie_route_table_france" {
  provider = aws.france
  vpc_id   = aws_vpc.mealie_vpc_france.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mealie_igw_france.id
  }

  tags = {
    Name = "Mealie-RouteTable-France"
  }
}

resource "aws_route_table" "mealie_route_table_allemagne" {
  provider = aws.allemagne
  vpc_id   = aws_vpc.mealie_vpc_allemagne.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mealie_igw_allemagne.id
  }

  tags = {
    Name = "Mealie-RouteTable-Allemagne"
  }
}

# ==============================
# 🔹 Association des Subnets avec la Route Table
# ==============================
resource "aws_route_table_association" "mealie_subnet_assoc_france" {
  provider      = aws.france
  subnet_id     = aws_subnet.mealie_subnet_france.id
  route_table_id = aws_route_table.mealie_route_table_france.id
}

resource "aws_route_table_association" "mealie_subnet_assoc_allemagne" {
  provider      = aws.allemagne
  subnet_id     = aws_subnet.mealie_subnet_allemagne.id
  route_table_id = aws_route_table.mealie_route_table_allemagne.id
}
