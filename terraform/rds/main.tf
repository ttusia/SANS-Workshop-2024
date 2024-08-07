resource "aws_db_instance" "my_db" {
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  username          = "root"
  password          = "my_super_secret_password"
  #manage_master_user_password = true
  skip_final_snapshot         = true
  #tags = {
  #  data_classification = "private"
  #}
}
