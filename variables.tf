variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = <<EOF

  #!/bin/bash

  sudo amazon-linux-extras install ansible2 -y

  aws s3 cp s3://kilp-ansible/httpd.yaml httpd.yaml

  sudo ansible-playbook httpd.yaml

EOF

}

variable "AWS_ACCESS_KEY_ID" {
    type        = string
    description = "AWS Access Key Environmental Variable."
}
variable "AWS_SECRET_ACCESS_KEY" {
    type        = string
    description = "AWS Secret Access Key Environmental Variable."
}