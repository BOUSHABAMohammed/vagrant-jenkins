
Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-20.04"


  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 9090, host: 9090, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 50000, host: 50000, host_ip: "127.0.0.1"

  config.vm.synced_folder "./docker", "/home/docker"


  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
    vb.cpus = 2
    vb.name = 'jenkins'
  end

  config.vm.provision :shell, :path => "vagrant-jenkins-vm-init.sh", :args => "#{ARGV.join(" ")}"
end
