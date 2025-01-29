variable "instance_type" {
  description = "Type d'instance EC2"
  default     = "t2.micro"
}

variable "ami_france" {
  description = "AMI ID pour la région France"
  default     = "ami-0359cb6c0c97c6607"  
}

variable "ami_allemagne" {
  description = "AMI ID pour la région Allemagne"
  default     = "ami-07eef52105e8a2059" 
}

variable "key_name" {
  description = "Nom de la clé SSH"
  default     = "mealie-key"
}
