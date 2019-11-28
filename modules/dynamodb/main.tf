# Create a dynamodb_table that:
# - name is received by table_name variable
# - hash_key == id
# - contains an attribute id of type S
# - billing_mode == PAY_PER_REQUEST

resource "aws_dynamodb_table" "table" {
  name     = "${var.table_name}"
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
}
