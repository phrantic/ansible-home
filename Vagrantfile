VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use the same key for each machine
  config.ssh.insert_key = false

  config.vm.define "vagrant1" do |vagrant1|
    vagrant1.vm.box = "centos/7"
    vagrant1.vm.box_version = "1804.02"
    vagrant1.vm.hostname = "vagrant1"
    vagrant1.vm.network "private_network", type: "dhcp"
    vagrant1.vm.network "forwarded_port", guest: 80, host: 8080
    vagrant1.vm.network "forwarded_port", guest: 443, host: 8443
  end
  config.vm.define "vagrant2" do |vagrant2|
    vagrant2.vm.box = "centos/7"
    vagrant2.vm.box_version = "1804.02"
    vagrant2.vm.hostname = "vagrant2"
    vagrant2.vm.network "private_network", type: "dhcp"
    vagrant2.vm.network "forwarded_port", guest: 80, host: 8081
    vagrant2.vm.network "forwarded_port", guest: 443, host: 8444
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "config_hosts.yml"
  end
#  config.vm.define "vagrant3" do |vagrant3|
#    vagrant3.vm.box = "centos/7"
#    vagrant3.vm.network "forwarded_port", guest: 80, host: 8082
#    vagrant3.vm.network "forwarded_port", guest: 443, host: 8445
#  end
end
