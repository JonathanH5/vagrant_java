# Vagrant for external Java Maven Projects 

All shell scripts are invoked from the Vagrantfile via provisioning. There, you can find details about them.
* Setup an execution environment with Maven, Java and Git (using `Vagrant/setup_tools.sh`)
* Set up a Maven Java project from Git (using `Vagrant/setup_maven_project.sh`)
* Install a maven dependency that is not available in the maven central but needs to be cloned from Git (using `Vagrant/setup_maven_dependency.sh`)
* Set everything up to develop the Java project on your host machine with Atom (see explenation below)

# Configure autocomplete-java for Atom

In order to use this package, we need to provide access to our maven repository from the VM. Unfortunately, we need a running JDK for that so be sure to install it on your host machine and setup your JAVA_HOME.

The two steps below need to be redone every time the classpath changes. For that matter, `Vagrant/setup_autocomplete-java.sh` exists which is also executed when `vagrant up` is performed. Rerun manually when necessary by using the script. You don't need to do this by performing the descriped steps.

## Maven Repository

There needs to be one hidden folder at /vagrant (inside the VM). This folder is synced to your host into the Vagrant/ folder:
* .m2/ : contains the maven repository

This folders is filled with the following command:
* `rsync -a ~/.m2/ /vagrant/Vagrant/.m2`

It is recommended to be rerun each time `mvn compile` or `mvn package` was executed.

## Generate the .classpath file required for the autocomplete-java package

1. generate file by executing `mvn dependency:build-classpath -Dmdep.outputFile=.classpath`.
2. replace all `/home/vagrant/.m2` in the .classpath file with `../Vagrant/.m2`.

Unfortunately, auto-completion for the own project is not supported by this method right now.
