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



#!/bin/bash
  #sudo su
  #yum -y install httpd
  #echo '<p> My Instance Deployed by Terraform! </p>' >> /var/www/html/index.html
  #sudo systemctl enable httpd
  #sudo systemctl start httpd

  #wget https://kilp-ansible.s3.amazonaws.com/httpd.yaml