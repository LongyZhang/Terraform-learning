resource "local_file" "pet" {
  filename = var.filename
  content  = "${random_pet.my-pet.id}-${var.object_test.name}-i dont like him:${var.object_test.favorite_pet}"

}


resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = var.separator
  length    = var.length
}

output "pet-name" {
  value       = random_pet.my-pet.id
  description = "Record ramdon pets name ,it can print result on the screen"
}
