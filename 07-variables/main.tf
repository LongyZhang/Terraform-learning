resource "local_file" "pet" {
  filename = var.filename
  content  = "${var.prefix[2]}-${var.object_test.name}-i dont like him:${var.object_test.favorite_pet}"

}


resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = var.separator
  length    = var.length
}
