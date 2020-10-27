data "aws_iam_policy_document" "web_server" {
  statement {
    sid    = "GetS3Stuff"
    effect = "Allow"
    actions = [
      "s3:List*",
      "s3:Get*"
    ]
    resources = ["*"]
  }
}
