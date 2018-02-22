ansible-playbook gather_facts.yml

ansible-playbook -i /etc/ansible/ec2.py list_instances.yml
ansible-playbook -i ec2.py list_instances.yml

ansible-playbook -i ec2.py list_instances.yml --extra-vars "state=['stopped']"

ansible-playbook -i ec2.py start_stopped_instance.yml

ansible-playbook -i ec2.py install_jupyter_notebook.yml --private-key "./tmp_key.pem"

# mount remote file system locally
sudo sshfs -o allow_other,default_permissions,IdentityFile="$(pwd)/tmp_key.pem" ubuntu@ec2-34-244-108-241.eu-west-1.compute.amazonaws.com:/ "$(pwd)/shared_fs_test/"
