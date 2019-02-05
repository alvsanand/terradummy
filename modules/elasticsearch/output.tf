output "arn" {
  value = "${aws_elasticsearch_domain.elasticsearch_dummy.arn}"
}

output "kibana_endpoint" {
  value = "${aws_elasticsearch_domain.elasticsearch_dummy.kibana_endpoint}"
}
