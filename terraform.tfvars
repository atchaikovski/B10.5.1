region                     = "us-east-1"
instance_type              = "t2.small"
enable_detailed_monitoring = true

private_key  =  "~/.ssh/aws_adhoc.pem"
public_key   =  "~/.ssh/aws_adhoc.pub"

common_tags = {
  Owner       = "Alex Tchaikovski"
  Project     = "Skill Factory B10.5.1 Homework"
  Purpose     = ""
}

vm_host_name = "postfix"
vm_count = 1

az           = "us-east-1a"