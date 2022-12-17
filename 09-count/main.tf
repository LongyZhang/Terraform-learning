resource "local_file" "pet" {
  filename = var.filename[count.index]
  content  = var.content.one
  count    = 3
}
