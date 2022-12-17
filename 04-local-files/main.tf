resource "local_file" "pet" {
  filename        = "C:/Users/admin/Desktop/Terraform/04-local-files/pets.txt"
  content         = ""
  file_permission = "0700"
}
