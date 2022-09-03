resource "aws_s3_bucket" "datalake" {
  # parametros de configuracao
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

}

resource "aws_s3_bucket_object" "codigo_spark" {

  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark.py"
  acl    = "private"
  source = "../job/job_spark.py"
  etag   = filemd5("../job/job_spark.py")
}

resource "aws_s3_bucket_object" "arquivos_rais" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/"
  acl    = "private"
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "staging" {

  bucket = aws_s3_bucket.datalake.id
  key    = "staging/rais/"
  acl    = "private"
  source = "/dev/null"
}

# Comandos terraform

# terraform init
# terraform fmt
# terraform validate
# terraform plan
# terraform apply
# terraform destroy