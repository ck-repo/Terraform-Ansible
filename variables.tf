variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = <<EOF

  #!/bin/bash

  sudo amazon-linux-extras install ansible2 -y

  aws s3 cp s3://kilp-ansible/httpd.yaml httpd.yaml

  sudo ansible-playbook httpd.yaml

EOF

}
