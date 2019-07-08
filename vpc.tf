resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "whatever-name"
    }
}

output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

/*  Public Subnets 1 per AZ */

/* 1a */
resource "aws_subnet" "eu-central-1a-public" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_cidr_1a}"
    availability_zone = "eu-central-1a"

    tags = {
        Name = "Public Subnet 1a"
    }
}

resource "aws_route_table" "eu-central-1a-public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "Public Subnet 1a route table"
    }
}

resource "aws_route_table_association" "eu-central-1a-public" {
    subnet_id = "${aws_subnet.eu-central-1a-public.id}"
    route_table_id = "${aws_route_table.eu-central-1a-public.id}"
}


/* 1b */

resource "aws_subnet" "eu-central-1b-public" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_cidr_1b}"
    availability_zone = "eu-central-1b"

    tags = {
        Name = "Public Subnet 1b"
    }
}

resource "aws_route_table" "eu-central-1b-public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "Public Subnet 1b route table"
    }
}

resource "aws_route_table_association" "eu-central-1b-public" {
    subnet_id = "${aws_subnet.eu-central-1b-public.id}"
    route_table_id = "${aws_route_table.eu-central-1b-public.id}"
}


/* 1c */

resource "aws_subnet" "eu-central-1c-public" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_cidr_1c}"
    availability_zone = "eu-central-1c"

    tags = {
        Name = "Public Subnet 1c"
    }
}

resource "aws_route_table" "eu-central-1c-public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "Public Subnet 1c route table"
    }
}

resource "aws_route_table_association" "eu-central-1c-public" {
    subnet_id = "${aws_subnet.eu-central-1c-public.id}"
    route_table_id = "${aws_route_table.eu-central-1c-public.id}"
}

/*
  Private Subnet
*/

/* 1a */
resource "aws_subnet" "eu-central-1a-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr_1a}"
    availability_zone = "eu-central-1a"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "eu-central-1a-private" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw-1a.id}"
    }

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "eu-central-1a-private" {
    subnet_id = "${aws_subnet.eu-central-1a-private.id}"
    route_table_id = "${aws_route_table.eu-central-1a-private.id}"
}

/* 1b */
resource "aws_subnet" "eu-central-1b-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr_1b}"
    availability_zone = "eu-central-1b"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "eu-central-1b-private" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw-1b.id}"
    }

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "eu-central-1b-private" {
    subnet_id = "${aws_subnet.eu-central-1b-private.id}"
    route_table_id = "${aws_route_table.eu-central-1b-private.id}"
}

/* 1c */
resource "aws_subnet" "eu-central-1c-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr_1c}"
    availability_zone = "eu-central-1c"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "eu-central-1c-private" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw-1c.id}"
    }

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "eu-central-1c-private" {
    subnet_id = "${aws_subnet.eu-central-1c-private.id}"
    route_table_id = "${aws_route_table.eu-central-1c-private.id}"
}

/* NAT Gateway */


// Creates elastic IPs and NAT gateways

resource "aws_eip" "nat-1a" {
    vpc = true
    tags = {
        Name = "nat-1a"
    }
}

resource "aws_eip" "nat-1b" {
    vpc = true
    tags = {
        Name = "nat-1b"
    }
}

resource "aws_eip" "nat-1c" {
    vpc = true
    tags = {
        Name = "nat-1c"
    }
}

resource "aws_nat_gateway" "gw-1a" {
  allocation_id = "${aws_eip.nat-1a.id}"
  subnet_id     = "${aws_subnet.eu-central-1a-public.id}"
}

resource "aws_nat_gateway" "gw-1b" {
  allocation_id = "${aws_eip.nat-1b.id}"
  subnet_id     = "${aws_subnet.eu-central-1b-public.id}"
}

resource "aws_nat_gateway" "gw-1c" {
  allocation_id = "${aws_eip.nat-1c.id}"
  subnet_id     = "${aws_subnet.eu-central-1c-public.id}"
}
