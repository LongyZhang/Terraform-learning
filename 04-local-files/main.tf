resource "local_file" "pet" {
  filename        = "C:/Users/admin/Desktop/Terraform/04-local-files/pets.txt"
  content         = "i love pets"
  file_permission = "0700"
}

resource "local_file" "cat" {
  filename        = "C:/Users/admin/Desktop/Terraform/04-local-files/cat.txt"
  content         = "i love cat"
  file_permission = "0700"
}

