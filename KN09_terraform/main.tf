provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "db_sg" {
  name        = "kn09-db-sg"
  description = "Allow MySQL inbound traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB-KN09-SG"
  }
}

resource "aws_instance" "db_kn09" {
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "t2.micro"
  key_name               = "vorname1"
  vpc_security_group_ids = [sg-01544a6eec71dd78e]
  subnet_id              = "subnet-05c07dc1d87fc3f6d"
  user_data              = file("KN09-cloud-init-db.yml")

  tags = {
    Name = "DB-KN09"
  }
}