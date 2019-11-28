# Create an output arn that returns the arn attribute of the aws_dynamodb_table resource
output "arn" {
  value = "${aws_dynamodb_table.table.arn}"
}
