output "name" {
  value = var.object_test.name
}

output "do_i_like_him" {
  value = var.object_test.favorite_pet
}

output "pet_name" {
  value = random_pet.my-pet.id
}
