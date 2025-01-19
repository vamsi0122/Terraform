resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags
    )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.gw_name
    )
}

resource "aws_subnet" "public" {
  count = length(var.public_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.awz[count.index]
  tags = merge(
    var.common_tags,
    {
      Name = var.public_tags_name[count.index]
    }
    )
}


resource "aws_subnet" "private" {
  count = length(var.private_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.awz[count.index]
  tags = merge(
    var.common_tags,
    {
      Name = var.private_tags_name[count.index]
    }
    )
}


resource "aws_subnet" "databse" {
  count = length(var.database_cidr)
  vpc_id = aws_vpc.main.id
  availability_zone = var.awz[count.index]
  cidr_block = var.database_cidr[count.index]
  tags = merge(
    var.common_tags,
    {
    Name = var.database_tags_name[count.index]
    }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    
      var.common_tags,
      var.public_route_table_tags
  )
}

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
  depends_on = [ aws_route_table.public ]
}



  resource "aws_route_table_association" "public" {
  count = length(var.public_cidr)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    
      var.common_tags,
      var.private_route_table_tags
  )
}

resource "aws_route_table_association" "a" {
  count = length(var.private_cidr)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.database_route_table_tags
  )
}

resource "aws_route_table_association" "database" {
   count = length(var.database_cidr)
   route_table_id = aws_route_table.database.id
   subnet_id = element(aws_subnet.databse[*].id, count.index)
}