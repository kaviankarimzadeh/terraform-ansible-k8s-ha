
```
Deploy a Kubernetes Cluster using Terraform/Ansible on Alma Linux/Rocky OS - (Hetzner)
```

```
First we need to obtain a API token from our Hetzner account.
Project >> Security >> API token >> Generate API token
```

```
SSH_KEY config:
update user_data.yml and ssh.tf with correct info.
```

```
Run the following commmands: (it will prompt you for API_TOKEN)
terraform init
terraform plan
terraform apply
```

```
Update local /etc/hosts file with correct info of IP HOSTNAME.
```

#Deployment steps:

#1
```
Update ansible config file with correct path for inventory
```

#2 insall Python
```
{
    sudo yum -y groupinstall "Development Tools"
    sudo yum -y install openssl-devel bzip2-devel libffi-devel xz-devel wget
    cd /usr/src/ 
    sudo wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
    sudo tar -xvzf Python-3.8.12.tgz
    cd Python-3.8.12/
    ./configure --enable-optimizations
    sudo make altinstall
    python3.8 --version
}
```

#3 install Ansible
```
{
    cd
    python3.8 -m venv project
    source project/bin/activate
    pip install --upgrade pip
    pip install ansible
}
```

#4 
```
{
    export ANSIBLE_CONFIG=<path-to-ansible-cfg>/ansible.cfg
    echo "export ANSIBLE_CONFIG=<path-to-ansible-cfg>/ansible.cfg" >> ~/.profile
    ansible --version
}
```


#5 install required collections for ansible
```
{
    ansible-galaxy collection install ansible.posix
    ansible-galaxy collection install kubernetes.core
}
```

#6 run playbook

```
    ansible-playbook <path-to-playbook>k8s-ha-deployment.yaml
```