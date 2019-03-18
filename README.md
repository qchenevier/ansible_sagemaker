## Purpose

Sagemaker is a great amazon product for data scientists: among many features, the most useful one is the ability to easily:
- deploy an EC2 instance
- clone a git repository on it
- start a jupyterlab server

This is really powerful to launch an experiment.

However, this product does not allow to have the spot pricing of AWS EC2 instances. Spot pricing allows to have up to a **70% discount**, so it can be a deal breaker if you are forced to pay the on-demand price to experiment with your data.

Those ansible playbooks allows to **mimic Sagemaker** while paying the **spot price** and additionally:
- creates a ssh tunnel
- mounts a ssh file system from the instance to your local laptop.

## Usage

### Configuration

You need to create a `all.yml` config file in the `group_vars` folder:
```
cp group_vars/all.yml.example group_vars/all.yml
```

Edit the created `all.yml` file to fit your needs.

> ⚠️ This is where you provide the maximum pricing you wish to pay

> ⚠️ You have to provide a valid gitlab token, in order to clone the git repository

### Configuring EC2 access

**How to use it ?**

```
ansible-playbook config_EC2.yml
```

**What does it do ?**

- retrieves a new ssh key file, if there is none in the folder
- configures EC2 inbound access rules with your IP, in order to connect to the instances you launch.


**When using it ?**

- before first use
- every time your change your IP
- when you want to renew your ssh key: delete first the ssh key file in the folder, then re-run the playbook


### Starting the EC2 instance

**How to use it ?**

```
ansible-playbook start_EC2.yml
```

**What does it do ?**

- starts an EC2 instance (deep learning AMI by default)
- creates a utilities folder containing various files:
  - script to connect to the instance: `connect_ssh.sh`
  - config file for the remote_ftp plugin of atom (useful if you are on windows and can't use sshfs): `remote_ftp/.ftpconfig`
  - script to mount the ssh filesystem: `mount_sshfs.sh`
  - script to unmount the ssh filesystem: `umount_sshfs.sh`
  - script to relaunch the ssh tunnel: `ssh_tunnel.sh`
  This utility folder is located in `../ansible_sagemaker_instance`
- installs `htop` on the EC2 instance
- copies the local aws credentials to the instance, useful if you use `boto3`
- starts `jupyter`
- starts an ssh tunnel towards the running instance
- clones the gitlab repository

**When using it ?**

- when you want to start the EC2 notebook instance
- when the ssh tunnel is broken (e.g: deco/reco on wifi)

### Stopping the EC2 instance

**How to use it ?**

```
ansible-playbook stop_EC2.yml
```

**What does it do ?**

- terminates the EC2 instance
- deletes the utilities folder

**When using it ?**

- when you want to stop the EC2 notebook instance
