ansible-playbook gather_facts.yml

ansible-playbook -i /etc/ansible/ec2.py print_facts.yml
ansible-playbook -i ec2.py print_facts.yml

ansible-playbook -i ec2.py print_facts.yml --extra-vars "state_filter=['stopped']"

ansible-playbook -i ec2.py install_jupyter_notebook.yml --private-key "./tmp_key.pem"
