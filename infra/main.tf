# S3 for frontend
resource "aws_s3_bucket" "frontend" {
  bucket = var.frontend_bucket_name
  acl    = "public-read"
}

# RDS for financial data
resource "aws_db_instance" "financial_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  skip_final_snapshot  = true
}

# EC2 for backend API
resource "aws_instance" "backend" {
  ami           = "ami-08c40ec9ead489470" # Ubuntu 22.04 (example)
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = file("${path.module}/deploy/user_data.sh")
}
