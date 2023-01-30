data "aws_vpc" "stage-myvpc" {
  #default = true           # default vpc      
  filter { # customize vpc
    name   = "tag:Name"
    values = ["stage-myvpc"]
  }
}

output "my_vpc_id" {
  value = data.aws_vpc.stage-myvpc.id
}


data "aws_subnet_ids" "example" {
  vpc_id = data.aws_vpc.stage-myvpc.id
}

data "aws_subnet" "example" {
  filter {
    name   = "tag:Name"
    values = ["stage-public-subnets-1"]
  }
}

output "my_subnet_cidr_block" {
  value = data.aws_subnet.example.id
}