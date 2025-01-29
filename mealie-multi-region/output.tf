output "mealie_france_ip" {
  description = "Adresse IP publique de l'instance Mealie en France"
  value       = aws_instance.mealie_france.public_ip
}

output "mealie_allemagne_ip" {
  description = "Adresse IP publique de l'instance Mealie en Allemagne"
  value       = aws_instance.mealie_allemagne.public_ip
}
