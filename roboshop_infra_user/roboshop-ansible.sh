#!/bin/bash
yum install ansible -y
cd /tmp
git clone https://github.com/sivadevopsdaws74s/ansible-roboshop-roles.git
cd ansible-roboshop-roles

components=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "card" "shipping" "payment" "web")

for component in "${components[@]}"; do
   ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component="$component" main.yaml
done