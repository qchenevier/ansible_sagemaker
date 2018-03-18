ansible-playbook -i ec2.py deep_learning_start.yml
ansible-playbook -i ec2.py deep_learning_stop.yml

# mount remote file system locally
sudo sshfs -o allow_other,default_permissions,IdentityFile="$(pwd)/my_ssh_key.pem" ubuntu@ec2-34-244-108-241.eu-west-1.compute.amazonaws.com:/home/ubuntu "$(pwd)/shared_fs_test/"
