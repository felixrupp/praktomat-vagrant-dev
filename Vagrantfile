# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "jaljale/trusty64_django"
    config.vm.network "private_network", ip: "192.168.33.15"
    config.vm.hostname = "praktomat"
    #config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    
    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
    config.vm.synced_folder ".", "/home/vagrant", :nfs => { :mount_options => ["dmode=777","fmode=666", 'vers=3', 'tcp', 'fsc' ,'actimeo=2'] }
    
    config.vm.provision "shell", path: "install.sh", privileged: false
end