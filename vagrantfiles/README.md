# Vagrantfile for WSO2 Stream Processor

This section defines the procedure to execute run Vagrant resources for a specific profile of the WSO2 Stream Processor.

Please note that in order to run these Vagrant resources use, you need to install
[Oracle VM VirtualBox](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html),
as Vagrant uses Oracle VM VirtualBox as the default provider.

Virtualization should be enabled in BIOS settings before building the boxes.

## How to run the Vagrantfile

1. Checkout this repository into your local machine using the following Git command.

```
    git clone https://github.com/wso2/vagrant-sp.git
```

2. Build and add the Vagrant boxes for external MySQL database and WSO2 Stream Processor using the Vagrantboxes resources.

3. Move to `vagrantfiles` folder.

```
    cd vagrantfiles
```

**Following are the WSO2 Stream Processor profiles**

  1. Dashboard
  2. Editor
  3. Manager
  4. Worker

## To select a profile,

### Dashboard profile

Move to `dashboard` folder.

```
    cd dashboard
```

### Editor profile

 Move to `editor` folder.

```
    cd editor
```

### Manager profile

 Move to `manager` folder.

```
    cd manager
```

### Worker profile

 Move to `worker` folder.

```
    cd worker
```

### Run the selected profile using the following command.

```
    vagrant up
```