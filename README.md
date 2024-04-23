# DeveloperSandbox
Build a set of containers in OpenShift developer sandbox.

## Getting Started
These instructions will get you started on setting up the environment to run this application in a rootless container.

## Prerequisites
The server is running on Red Hat Enterprise Linux with podman installed.

## Install Podman

> \\> yum install -y container-tools
> \\> yum install -y podman-docker

## Setting up rootless user

> \\> useradd -c "bookmark" bookmark
> \\> passwd bookmark

## Disable SELinux Temporarily

> \\> sestatus
> \\> setenforce 0
> \\> setenforce 1

## Setting up the firewall

> \\> firewall-cmd --permanent --zone=public --add-service=http
> \\> firewall-cmd --permanent --zone=public --add-service=https

> \\> firewall-cmd --permanent --zone=public --add-port=5081/tcp
> \\> firewall-cmd --permanent --zone=public --add-port=5444/tcp
> \\> firewall-cmd --permanent --zone=public --add-port=5001/tcp
> \\> firewall-cmd --permanent --zone=public --add-port=5507/tcp

> \\> firewall-cmd --reload

## Deploy the containers localy

> \\> ./projectbuild.sh

## Setup the database for MySQL

Configure the application database and set permissions.

> \\> ./database/dataconfig.sh

Connect to the database server and run all sql commands found in ./database/datatablecreate.txt to create all tables.

## Verify the installation

curl -v https://localhost:5444

## Deploy in openshift Developer Sandbox

### Login to image repository

> \\> oc login --token=sha256~123456789 --server=https://api.sandbox-m3.1530.p1.openshiftapps.com:6443

### Build Database image

> \\> ansible-playbook -k -i ./hosts --vault-password-file ../../ansible-vault.txt ./build-database-image.yml

### Deploy Database image

> \\> ansible-playbook -k -i ./hosts ./deploy-database.yml

### Build Application image

> \\> ansible-playbook -k -i ./hosts --vault-password-file ../../ansible-vault.txt ./build-application-image.yml

### Build new version of Application image

> \\> ansible-playbook -k -i ./hosts --vault-password-file ../../ansible-vault.txt ./build-application-image.yml --extra-vars "app_image=app-bookmark-v2.0"

### Deploy Application image

> \\> ansible-playbook -k -i ./hosts ./deploy-application.yml

### Build Webserver image

> \\> ansible-playbook -k -i ./hosts --vault-password-file ../../ansible-vault.txt ./build-webserver-image.yml

### Deploy Webserver image

> \\> ansible-playbook -k -i ./hosts ./deploy-webserver.yml

### Remove all deployments

> \\> ansible-playbook -k -i ./hosts ./remove-bookmark.yml

### Switch deployment image version

> \\> oc set image deploy/app-bookmark app-bookmark=quay.io/gresident/residentsystem/app-bookmark-v2.0

## Built With
* Visual Studio Code - Code editor

## Contributing
Please read CONTRIBUTING for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning
We use SemVer for versioning. For the versions available, see the tags on this repository.

## Authors
Eric Lacroix - Initial work

See also the list of contributors who participated in this project.

## License
This project is licensed under the MIT License - see the LICENSE file for details