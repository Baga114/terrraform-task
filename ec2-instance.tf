# Create a security group for the EC2 instance
resource "aws_security_group" "instance_security_group" {
  name_prefix = "instance-sg"
  vpc_id = aws_vpc.vpc_b.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Create an EC2 key pair
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pk" {
  key_name   = "myKey"       # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }
}
# Launch an EC2 instance in the private subnet
resource "aws_instance" "my_instance" {
  ami = "ami-0c55b159cbfafe1f0" # Change to your desired AMI
  instance_type = "t2.micro" # Change to your desired instance type
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]
  subnet_id = aws_subnet.private_subnet_b_1.id
  key_name =  "mykey" 

  connection {
    type = "ssh"
    user = "ubuntu" 
    private_key = tls_private_key.pk.private_key_pem
    # private_key = aws_key_pair.pk.private_key_pem
    host        = aws_instance.my_instance.public_ip
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "echo 'test2' | sudo tee /var/www/html/test2.htm",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo ufw allow 'Nginx Full'",
      "sudo ufw allow ssh",
      "sudo ufw enable",
    ]
  }

  tags = {
    Name = "my-instance"
  }
}

