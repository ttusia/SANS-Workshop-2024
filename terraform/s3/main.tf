resource "aws_s3_bucket" "test" {
  bucket = "test"

  #tags = {
  #  data_classification = "private"
  #  owner_email = "admin@mydomain.com"
  #}
}