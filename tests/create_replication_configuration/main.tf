resource "random_id" "name" {
  byte_length = 6
  prefix      = "tardigrade-s3-bucket-"
}

provider "aws" {
  alias  = "west"
  region = "us-west-1"
}

resource "aws_iam_role" "replication" {
  name = "tf-iam-role-replication-12345"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "s3.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
    }
  )

  inline_policy {
    name = "tf-iam-role-policy-replication-12345"

    policy = jsonencode(
      {
        "Version" : "2012-10-17",
        "Statement" : [
          {
            "Action" : [
              "s3:GetReplicationConfiguration",
              "s3:ListBucket"
            ],
            "Effect" : "Allow",
            "Resource" : [
              "arn:aws:s3:::${random_id.name.hex}"
            ]
          },
          {
            "Action" : [
              "s3:GetObjectVersionForReplication",
              "s3:GetObjectVersionAcl",
              "s3:GetObjectVersionTagging"
            ],
            "Effect" : "Allow",
            "Resource" : [
              "arn:aws:s3:::${random_id.name.hex}}/*"
            ]
          },
          {
            "Action" : [
              "s3:ReplicateObject",
              "s3:ReplicateDelete",
              "s3:ReplicateTags"
            ],
            "Effect" : "Allow",
            "Resource" : "${aws_s3_bucket.destination.arn}/*"
          }
        ]
      }
    )
  }
}

resource "aws_s3_bucket" "destination" {
  provider = aws.west

  bucket        = format("%s-%s", "destination", random_id.name.hex)
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "destination" {
  provider = aws.west

  bucket = aws_s3_bucket.destination.id

  versioning_configuration {
    status = "Enabled"
  }
}

module "create_replication_configuration" {
  source = "../../"

  bucket        = random_id.name.hex
  versioning    = "Enabled"
  force_destroy = true

  replication_configuration = {
    role = aws_iam_role.replication.arn

    rules = [
      {
        id                               = "foobar"
        delete_marker_replication_status = "Disabled"
        status                           = "Enabled"

        destination = {
          bucket        = "arn:aws:s3:::${aws_s3_bucket_versioning.destination.id}"
          storage_class = "STANDARD"
        }

        filter = {
          prefix = "foo"
        }
      },
    ]
  }
}

output "create_replication_configuration" {
  value = module.create_replication_configuration
}
