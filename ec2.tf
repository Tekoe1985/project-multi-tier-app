// ec2 instance code
resource "aws_instance" "web" {
  ami                    = "ami-045269a1f5c90a6a0"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data              = file("setup.sh")

  tags = {
    Name        = "multi-tier app"
    environment = "dev"
  }
}


//ebs volume attachment
resource "aws_ebs_volume" "web_ebs" {
    availability_zone = aws_instance.web.availability_zone
    size              = 10
    tags = {
      Name = "web-ebs"
    }
    
    }
    resource "aws_volume_attachment" "att" {
      instance_id = aws_instance.web.id
      volume_id   = aws_ebs_volume.web_ebs.id
        device_name = "/dev/sdb"
    }