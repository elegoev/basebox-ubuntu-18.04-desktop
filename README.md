# ubuntu-18.04-desktop

Vagrant Box with Ubuntu 18.04 and desktop

## Base image

Used base image [elegoev/ubuntu-18.04](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04)

## Directory Description

| directory | description                                          |
|-----------|------------------------------------------------------|
| inspec    | inspec test profiles with controls                   |
| packer    | packer build, provisioner and post-processor scripts |
| test      | test environment for provision & inspec development  |

## Configuration

### Vagrant Cloud

- [elegoev/ubuntu-18.04-desktop](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04-desktop)

### Useful Vagrant Plugins

- [vagrant-disksize](https://github.com/sprotheroe/vagrant-disksize)
- [vagrant-hosts](https://github.com/oscar-stack/vagrant-hosts)
- [vagrant-secret](https://github.com/tcnksm/vagrant-secret)
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)
- [vagrant-serverspec](https://github.com/vvchik/vagrant-serverspec)
- [vagrant-vmware-esxi](https://github.com/josenk/vagrant-vmware-esxi)

### Using desktop

#### Vagrantfile

    Vagrant.configure("2") do |config|

        $basebox_name="ubuntu-18.04-desktop-test"
        $basebox_hostname="ubuntu-1804-desktop-test"
        $src_image_name="elegoev/ubuntu-18.04-desktop"
        $vb_group_name="basebox-desktop-test"

        config.vm.define "#{$basebox_name}" do |machine|
          machine.vm.box = "#{$src_image_name}"
    
          # define guest hostname
          machine.vm.hostname = "#{$basebox_hostname}"

          machine.vm.provider "virtualbox" do |vb|
            vb.name = $basebox_name
            vb.cpus = 1
            vb.customize ["modifyvm", :id, "--memory", "1024" ]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--groups", "/#{$vb_group_name}" ]
            vb.customize ["modifyvm", :id, "--vram", 256 ]
          end

        end   

    end

### Reference

- [Minimal Vagrant Ubuntu Desktop for Development](https://medium.com/@tonyeung85/minimal-vagrant-ubuntu-desktop-for-development-248c173cc5a2)
- [How can I install one language by command-line](https://askubuntu.com/questions/149876/how-can-i-install-one-language-by-command-line)
- [Change keyboard layout](https://askubuntu.com/questions/434849/change-keyboard-layout-english-uk-on-command-line-to-english-us)
- [How to Install Ubuntu Mate 18.04 LTS](https://linuxhint.com/install_ubuntu_mate_1804/)
- [Ubuntu 18.04: Connect to GNOME desktop environment via XRDP](https://www.hiroom2.com/2018/04/29/ubuntu-1804-xrdp-gnome-en/)
- [How to set up an xRDP server on Ubuntu 18.04](https://medium.com/@vivekteega/how-to-setup-an-xrdp-server-on-ubuntu-18-04-89f7e205bd4e)

### Versioning

Repository follows sematic versioning  [![semantic versioning](https://img.shields.io/badge/semver-2.0.0-green.svg)](http://semver.org)

### Changelog

For all notable changes see [CHANGELOG](https://github.com/elegoev/basebox-ubuntu-18.04-desktop/blob/master/CHANGELOG.md)

### License

Licensed under The MIT License (MIT) - for the full copyright and license information, please view the [LICENSE](https://github.com/elegoev/basebox-ubuntu-18.04-desktop/blob/master/LICENSE) file.

### Issue Reporting

Any and all feedback is welcome.  Please let me know of any issues you may find in the bug tracker on github. You can find it [here.](https://github.com/elegoev/basebox-ubuntu-18.04-desktop/issues)
