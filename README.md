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
> If you are to try out an already released zip of this repo, please ignore this 1st step.


3. Move to `vagrant-sp` folder.

```
cd vagrant-sp
```
>If you are to try out an already released zip of this repo, please ignore this 2nd step also. Instead, extract the zip file and directly browse to `vagrant-sp-<released-version>` folder.

>If you are to try out an already released tag, after executing 2nd step, checkout the relevant tag, i.e. for example: <br> git checkout tags/v4.0.0.2 and continue below steps.



4. Spawn up the Vagrant setup

```
vagrant up
```

5. Access the Status Dashboard and Editor via the given URL

```
http://172.28.128.7:9390/editor
https://172.28.128.6:9643/monitoring
````
