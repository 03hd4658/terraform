provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "myUser" {
  name = "iam_user"

}

resource "aws_iam_policy" "my_policy" {
  name = "S3-Billing"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucketMultipartUploads",
                "aws-portal:ModifyAccount",
                "s3:ListJobs",
                "s3:ListBucketVersions",
                "aws-portal:ViewAccount",
                "aws-portal:ModifyPaymentMethods",
                "s3:ListBucket",
                "aws-portal:ViewUsage",
                "s3:ListMultipartUploadParts",
                "s3:ListStorageLensConfigurations",
                "aws-portal:ModifyBilling",
                "aws-portal:ViewPaymentMethods",
                "s3:ListAllMyBuckets",
                "aws-portal:ViewBilling"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "policybinding" {
  name = "attachment"
  users = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.my_policy.arn
}
