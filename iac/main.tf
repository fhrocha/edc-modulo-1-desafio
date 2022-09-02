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
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")


}

resource "aws_s3_bucket_object" "arquivos_rais_1" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/RAIS_VINC_PUB_CENTRO_OESTE.7z"
  acl    = "private"
  source = "../rais/RAIS_VINC_PUB_CENTRO_OESTE.7z"
  etag   = filemd5("../RAIS_VINC_PUB_CENTRO_OESTE.7z")
}

resource "aws_s3_bucket_object" "arquivos_rais_2" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/RAIS_VINC_PUB_MG_ES_RJ.7z"
  acl    = "private"
  source = "../rais/RAIS_VINC_PUB_MG_ES_RJ.7z"
  etag   = filemd5("../RAIS_VINC_PUB_MG_ES_RJ.7z")
}

resource "aws_s3_bucket_object" "arquivos_rais_3" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/RAIS_VINC_PUB_NORDESTE.7z"
  acl    = "private"
  source = "../rais/RAIS_VINC_PUB_NORDESTE.7z"
  etag   = filemd5("../RAIS_VINC_PUB_NORDESTE.7z")
}

resource "aws_s3_bucket_object" "arquivos_rais_4" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/RAIS_VINC_PUB_NORTE.7z"
  acl    = "private"
  source = "../rais/RAIS_VINC_PUB_NORTE.7z"
  etag   = filemd5("../RAIS_VINC_PUB_NORTE.7z")
}

resource "aws_s3_bucket_object" "arquivos_rais_5" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/RAIS_VINC_PUB_SP.7z"
  acl    = "private"
  source = "../rais/RAIS_VINC_PUB_SP.7z"
  etag   = filemd5("../RAIS_VINC_PUB_SP.7z")
}

resource "aws_s3_bucket_object" "arquivos_rais_6" {

  bucket = aws_s3_bucket.datalake.id
  key    = "raw_data/rais/RAIS_VINC_PUB_SUL.7z"
  acl    = "private"
  source = "../rais/RAIS_VINC_PUB_SUL.7z"
  etag   = filemd5("../RAIS_VINC_PUB_SUL.7z")
}


# Comandos terraform

# terraform init
# terraform fmt
# terraform validate
# terraform plan
# terraform apply
# terraform destroy