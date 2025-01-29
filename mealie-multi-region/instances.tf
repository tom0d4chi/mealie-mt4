resource "aws_instance" "mealie_france" {
  provider                  = aws.france
  ami                       = var.ami_france
  instance_type             = var.instance_type
  key_name                  = aws_key_pair.mealie_key_france.key_name
  subnet_id                 = aws_subnet.mealie_subnet_france.id
  vpc_security_group_ids    = [aws_security_group.mealie_sg_france.id]
  associate_public_ip_address = true  

  tags = {
    Name = "Mealie-France"
  }

  depends_on = [
    aws_security_group.mealie_sg_france,
    aws_subnet.mealie_subnet_france
  ]
}

resource "aws_instance" "mealie_allemagne" {
  provider                  = aws.allemagne
  ami                       = var.ami_allemagne
  instance_type             = var.instance_type
  key_name                  = aws_key_pair.mealie_key_allemagne.key_name
  subnet_id                 = aws_subnet.mealie_subnet_allemagne.id
  vpc_security_group_ids    = [aws_security_group.mealie_sg_allemagne.id]
  associate_public_ip_address = true  

  tags = {
    Name = "Mealie-Allemagne"
  }

  depends_on = [
    aws_security_group.mealie_sg_allemagne,
    aws_subnet.mealie_subnet_allemagne
  ]
}


resource "aws_eip" "mealie_france_eip" {
  provider   = aws.france
  instance   = aws_instance.mealie_france.id
}

resource "aws_eip" "mealie_allemagne_eip" {
  provider   = aws.allemagne
  instance   = aws_instance.mealie_allemagne.id
}