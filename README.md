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

1.  Follow the instructions in this repository to build the WSO2 Stream Processor 4.0.0 and MYSQL Vagrant boxes.

```
    https://github.com/wso2/vagrant-boxes
```

2. Checkout this repository into your local machine using the following Git command.

```
    git clone https://github.com/wso2/vagrant-sp.git
```

3. Move to `vagrant-sp` folder.

```
    cd vagrant-sp
```

4. Spawn up the Vagrant setup

```
    vagrant up
```

5. Access the Status Dashboard and Editor via the given URL

```
    http://localhost:9390/editor
    https://localhost:9643/monitoring
```
