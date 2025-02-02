#!/bin/bash
yum install ansible -y
cd /tmp
git clone https://github.com/vamsi0122/ekart_configuration.git
cd ekart_configur

components=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "web")

for component in "${components[@]}"; do
   ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component="$component" main.yaml
done