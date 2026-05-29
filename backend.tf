terraform {
  backend "s3" {
    bucket = "terraform-automation-backup-data"
    key = "main"
    region = "ap-south-1"
    use_lockfile = true  
  }
}