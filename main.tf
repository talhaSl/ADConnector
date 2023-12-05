resource "aws_directory_service_directory" "connector" {
  name     = "kj77.shop"
  password = "Talha82542@"
  size     = "Small"
  type     = "ADConnector"

  connect_settings {
    customer_dns_ips  = ["172.31.29.186"]
    customer_username = "Administrator"
    subnet_ids        = [aws_subnet.foo.id, aws_subnet.bar.id]
    vpc_id            = aws_vpc.main.id
  }
}

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}
resource "aws_subnet" "foo" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-west-2b"
  cidr_block        = "172.31.16.0/20"
}
resource "aws_subnet" "bar" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-west-2a"
  cidr_block        = "172.31.32.0/20"
}


