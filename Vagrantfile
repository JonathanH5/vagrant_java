# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "8192"
  end

  # Install Maven, Java, Git and set encoding
  config.vm.provision "shell", path: "Vagrant/setup_tools.sh"

  # Install a maven dependency that is not available in the maven central but needs to be cloned from GitHub
  # ARGUMENTS: project name and url to repo (project will be stored at /home/vagrant/)
  config.vm.provision "shell", privileged: false, path: "Vagrant/setup_maven_dependency.sh", args: ["hermes", "https://github.com/dbermbach/hermes.git"]

  # Clone a git maven project for development and run mvn package
  # Arguments project name and url to repo (project will be stored at /vagrant/)
  config.vm.provision "shell", privileged: false, path: "Vagrant/setup_maven_project.sh", args: ["advanced_enterprise_computing_2016", "https://github.com/JonathanH5/advanced_enterprise_computing_2016.git"]

  # Set up autocomplete-java for Atom by generating the .classpath file for a project
  # ARGUMENTS: project name (project needs to be stored at /vagrant/)
  config.vm.provision "shell", privileged: false, run: "always", path: "Vagrant/setup_autocomplete_java.sh", args: ["advanced_enterprise_computing_2016"]

end
