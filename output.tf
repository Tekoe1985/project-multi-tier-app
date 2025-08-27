output "public-ip" {
    value = aws_instance.web
  
}
output "vpc-id" {
    value = aws_vpc.my-vpc.id
  
}