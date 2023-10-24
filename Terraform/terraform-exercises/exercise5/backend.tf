terraform {
  backend "s3" { # allows you to maintain infrastructure state across multiple states
    bucket = "terra-state-dove"  # the bucket name that should be created
    key    = "terraform/backend" # create a folder in the bucket
    region = "us-east-2" # region of the bucket
  }
}
