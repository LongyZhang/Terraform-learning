resource "aws_dynamodb_table" "cars" {
  name         = "car"
  hash_key     = "VIN"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "VIN"
    type = "S"
  }

}

resource "aws_dynamodb_table_item" "car-item" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key
  item       = <<EOF
        {
            "Manufacturer": {"S":"Subaru"},
            "Make": {"S":"WRX"},
            "Year": {"N":"2022"},
            "VIN": {"S":"12312"}
        }

    EOF
}


provider "aws" {
  region = "us-east-1"
}

