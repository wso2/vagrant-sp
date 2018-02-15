# Vagrantfile for WSO2 Stream Processor

This section defines the procedure to run Vagrant resources for a specific profile of the WSO2 Stream Processor.

Please note that in order to run these Vagrant resources, you need to install
[Oracle VM VirtualBox](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html),
as Vagrant uses Oracle VM VirtualBox as the default provider.

Virtualization should be enabled in BIOS settings before building the boxes.

**Following are the WSO2 Stream Processor profiles**

  1. Dashboard
  2. Editor
  3. Manager
  4. Worker

## How to run the Vagrantfile

1. Checkout this repository into your local machine using the following Git command.

```
    git clone https://github.com/wso2/vagrant-sp.git
```

2. Move to `vagrant-sp` folder.

```
    cd vagrant-sp
```

3. Spawn up the Vagrant setup

```
    vagrant up
```

4. Access the status dashboard via the given URL

```
    https://172.28.128.6:9643/monitoring
```
