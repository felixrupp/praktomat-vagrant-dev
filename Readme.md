# Vagrant setup for Praktomat development setup

This is a simple Vagrant setup file for a development installation of [Praktomat](https://github.com/KITPraktomatTeam/Praktomat).

It makes use of the [jaljale/trusty64_django](https://app.vagrantup.com/jaljale/boxes/trusty64_django) Vagrant box, which is ready for a Python based Django application setup (Praktomat is a Django app).

A basic shell provisioner installs all system wide dependencies via package manager and nearly completes the Praktomat installation for you.

The vagrant homefolder is mounted to your project folder via NFS3.


### Prerequisites

You will need an installation of [Vagrant](https://www.vagrantup.com).


### Installation

Clone this repository, switch inside the newly created directory and use the

    vagrant up

command to start the setup. The provisioner will run on first `up`. 


### Complete the Praktomat setup

To complete the Praktomat setup you only have to ssh into your Vagrant box and use the following command to create your first superuser:

    /home/vagrant/env/bin/python /home/vagrant/Praktomat/src/manage-devel.py createsuperuser

After that you can start the Praktomat development server with the command:

    startPraktomat


### Access the Praktomat app

After starting the development server, you can access your installation via ip-address in your browser:

    192.168.33.15:8000