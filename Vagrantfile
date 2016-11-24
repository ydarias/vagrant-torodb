Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "file", source: "mongod.service", destination: "~/mongod.service"
  config.vm.provision :shell, path: "bootstrap.sh"

end
