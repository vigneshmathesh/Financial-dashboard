# S3 for frontend
resource "aws_s3_bucket" "frontend" {
  bucket = frontend-project-2025
  acl    = "public-read"
}

# RDS for financial data
resource "aws_db_instance" "multi-tier-project-database" {
  allocated_storage    = 20
  engine               = "PostgreSQL"
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro"
  db_name              = var.db_name
  username             = var.db_user
  password             = 9659317499
  skip_final_snapshot  = true
}

# EC2 for backend API
resource "aws_instance" "backend" {
  ami           = "ami-0360c520857e3138f" # Ubuntu 22.04 (example)
  instance_type = t2.micro
  key_name      = multitier

  user_data = file("${path.module}/deploy/user_data.sh")
}
