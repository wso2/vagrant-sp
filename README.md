# Vagrantfile for WSO2 Stream Processor

In order to use Vagrant boxes, you will need an active subscription from WSO2 since the Vagrant boxes hosted at vagrant.wso2.com contains the latest updates and fixes to WSO2 Stream Processor. You can sign up for a Free Trial Subscription [here](https://wso2.com/free-trial-subscription).

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


2. Move to `vagrant-sp` folder.

```
cd vagrant-sp
```
>If you are to try out an already released zip of this repo, please ignore this 2nd step also. Instead, extract the zip file and directly browse to `vagrant-sp-<released-version>` folder.

>If you are to try out an already released tag, after executing 2nd step, checkout the relevant tag, i.e. for example: <br> git checkout tags/v4.3.0.1 and continue below steps.



3. Spawn up the Vagrant setup

```
vagrant --updates up
```

If you wish to use the Vagrant boxes without updates, spawn up the Vagrant setup using the following command.

```
vagrant up
```


4. Access the Status Dashboard and Editor via the given URL

```
http://localhost:9390/editor
https://localhost:9643/monitoring
````
