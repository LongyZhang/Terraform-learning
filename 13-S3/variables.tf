variable "filename" {

  default = ["C:/Users/sjia4/OneDrive/Desktop/Terraform-learning/13-S3/pets.txt"
    , "C:/Users/sjia4/OneDrive/Desktop/Terraform-learning/13-S3/dog.txt"
    , "C:/Users/sjia4/OneDrive/Desktop/Terraform-learning/13-S3/cat.txt"
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

