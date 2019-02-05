resource "aws_elasticsearch_domain" "elasticsearch_dummy" {
  domain_name           = "dummydomain"
  elasticsearch_version = "6.4"

  cluster_config {
    instance_type = "t2.medium.elasticsearch"
  }

  ebs_options {
      ebs_enabled = true
      volume_size = 10
  }
#   snapshot_options {
#     automated_snapshot_start_hour = 23
#   }

  tags = {
    Domain = "DummyDomain"
  }

   access_policies = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "es:*",
        "Principal": "*",
        "Effect": "Allow"
        }
    ]
    }
    POLICY
}
