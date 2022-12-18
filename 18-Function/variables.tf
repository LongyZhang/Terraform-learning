variable "filename" {

  default = ["C:/Users/admin/Desktop/Terraform/10-foreach/pets.txt"
    , "C:/Users/admin/Desktop/Terraform/10-foreach/dog.txt"
    , "C:/Users/admin/Desktop/Terraform/10-foreach/cat.txt"
  ]
}

variable "content" {

  default = {
    "one"   = "i love pets"
    "two"   = "i love dog"
    "three" = "i love cat"
  }
}

variable "contents" {

  default = [
    "i love pets",
    "i love dog",
    "i love cat"
  ]
}

variable "file_permission" {
  default = "0700"
}

variable "separator" {
  default = "."
}

variable "prefix" {
  default = ["Mr", 1, "Sir"]
  type    = list(any)
}

variable "length" {
  default = "1"
}

variable "object_test" {
  type = object({
    name         = string
    color        = string
    age          = number
    food         = list(any)
    favorite_pet = bool

  })

  default = {
    age          = 1
    color        = "red"
    favorite_pet = true
    food         = ["chicken", "beef"]
    name         = "Winnie-pooh"
  }
}

