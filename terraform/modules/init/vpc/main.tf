resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support  = true
  enable_dns_hostnames = true


  tags = {
    Name = var.name
    Environment = var.environment
    ManagedBy = "terraform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gateway"
    Environment = var.environment
    ManagedBy = "terraform"
  }
  
}

#public subnet
resource "aws_subnet" "public_subnet" {
  count = length(var.subnet_availability_zone)

  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidr_block, count.index)
  availability_zone = element(var.subnet_availability_zone, count.index)
  map_public_ip_on_launch = true

    tags = {
      # Name = "${var.public_subnet_name}-${count.index}"
      Name = "${var.environment}-vpc-subnet-public${count.index + 1}-${element(var.subnet_availability_zone, count.index)}"
      Environment = var.environment
      ManagedBy = "terraform"
    }
}

#private subnet
resource "aws_subnet" "private_subnet" {
  count = length(var.subnet_availability_zone)

  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidr_block, count.index)
  availability_zone = element(var.subnet_availability_zone, count.index)
  
      tags = {
        Name = "${var.environment}-vpc-subnet-private${count.index + 1}-${element(var.subnet_availability_zone, count.index)}"
        Environment = var.environment
        ManagedBy = "terraform"
    }
}

#route table for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_rt_name
    Environment = var.environment
    ManagedBy = "terraform"
  }
}

#route table for private subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.private_rt_name
    Environment = var.environment
    ManagedBy = "terraform"
  }
}

#associate route tabe to public subnet
resource "aws_route_table_association" "public_rt_assoc" {
  # count = length(var.public_subnet_cidr_blocks)
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Associate route table with private subnet
resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

# Create VPC Endpoints
# resource "aws_vpc_endpoint" "s3_endpoint" {
#   vpc_endpoint_type = "Gateway"
#   vpc_id = aws_vpc.main.id
#   service_name = "com.amazonaws.eu-central-1.s3"
#   route_table_ids = [aws_route_table.private_rt.id]
  
#   tags = {
#     Name = "s3-endpoint"
#     ManagedBy = "terraform"
#     Environment = "prod"
#   }
  
# }

# resource "aws_vpc_endpoint" "ecr_api_endpoint" {
#   vpc_endpoint_type = "Interface"
#   vpc_id = aws_vpc.main.id
#   service_name = "com.amazonaws.eu-central-1.ecr.api"
#   private_dns_enabled = true
#   subnet_ids = [  ]
# }
