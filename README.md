# PhotoPipe VM
A Debian 8.6, Vagrant virtual machine for running [PhotoPipe](https://github.com/maxperry/photometrypipeline), an automated photometry pipeline.

Works with macOS and Linux.

## Installation

#### 1) [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads) installer for your operating system.
**Note 1:** version 5.1.10 or higher is required due to a [bug](https://www.virtualbox.org/ticket/16084) affecting `urllib`.
**Note 2:** download and install also the **Oracle VM VirtualBox Extension Pack**.

#### 2) [Download Vagrant](https://releases.hashicorp.com/vagrant/1.8.6/) installer for your operating system.
**Note:** v1.8.6 of Vagrant is required due to a [bug](https://github.com/mitchellh/vagrant/issues/6725) affecting v1.8.7.

#### 3) Setup NFS (Linux only)

Because of an old [issue](http://stackoverflow.com/questions/26020114/vagrant-virtualbox-shared-folders-without-vboxsf) with VirtualBox's Shared Folders and `mmap`, as well as the poor performance of Shared Folders, folders from your host OS will be shared with the VM using Network File System (NFS).

To install NFS on your Linux system do:

```
$ sudo apt-get install nfs-kernel-server nfs-common portmap
```

This comes pre-installed on Mac OS X 10.5+ (Leopard and higher).

#### 4) Download and launch the VM

```
$ mkdir photopipe-vm && cd photopipe-vm
$ git clone git@github.com:maxperry/photometrypipeline-vm.git
$ chmod +x start.sh
$ sudo ./start.sh
```
This will SSH into the virtual machine. When required for the login password, type `vagrant`. Root password is also `vagrant`.

## Usage
Run all the commands below from the `photopipe-vm` folder where the VM is located.

#### Stopping the VM
```
$ cd photopipe-vm
$ vagrant suspend
```
#### Resuming the VM

```
$ cd photopipe-vm
$ ./start.sh
```

#### Removing the VM

```
$ cd photopipe-vm
$ vagrant destroy
```

See [Vagrant Getting Started](https://www.vagrantup.com/docs/getting-started/) docs for other commands.

## Configuration
The virtual machine is configured with 2 CPU cores and 2GB of RAM. These and other parameters can be edited from the [Vagrantfile](). 

```
config.vm.provider "virtualbox" do |vb|
	vb.memory = "2048"
	vb.cpus = "2"
end
```

See [here](https://www.vagrantup.com/docs/vagrantfile/) for a full description.
