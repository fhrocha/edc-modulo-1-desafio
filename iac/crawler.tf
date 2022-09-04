resource "aws_glue_crawler" "glue_crawler" {
  database_name = "rais_2020"
  name          = "glue-crawler-edc-prod-422471183879"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://datalake-edc-prod-422471183879/staging/rais/"
  }
}