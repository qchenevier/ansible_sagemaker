ansible-playbook -i ec2.py create_key.yml
ansible-playbook -i ec2.py create_instance.yml



ansible-playbook -i ec2.py list_instances.yml
ansible-playbook -i ec2.py start_stopped_instances.yml
ansible-playbook -i ec2.py start_jupyter_and_create_tunnel.yml


ansible-playbook -i ec2.py stop_running_instances.yml
ansible-playbook -i ec2.py stop_instances_and_tunnels.yml




# mount remote file system locally
sudo sshfs -o allow_other,default_permissions,IdentityFile="$(pwd)/tmp_key.pem" ubuntu@ec2-34-244-108-241.eu-west-1.compute.amazonaws.com:/ "$(pwd)/shared_fs_test/"
