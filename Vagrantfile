# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "centos/7"

  ENV['ANSIBLE_ROLES_PATH'] = './roles'

  config.vm.define "grafana" do |grafana|

  grafana.vm.provider :virtualbox do |vb|

    vb.name = "grafana"

    vb.customize ["modifyvm", :id, "--memory", "2048"]
  
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  
    end
  
    grafana.vm.network "private_network", ip: "192.168.10.101"
    # grafana.ssh.username = "vagrant"
    grafana.vm.hostname = "grafana"
  
    grafana.vm.provision "ansible" do |ansible|
      ansible.playbook = "grafana.yml"
      ansible.extra_vars = {
      }
    end
  end

  config.vm.define "prometheus" do |prometheus|

    prometheus.vm.provider :virtualbox do |vb|
  
      vb.name = "prometheus"
  
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    
      vb.customize ["modifyvm", :id, "--cpus", "1"]
    
      end
    
      prometheus.vm.network "private_network", ip: "192.168.10.102"
    
      prometheus.vm.hostname = "prometheus"
    
      config.vm.provision "ansible" do |ansible|
        ansible.playbook = "prometheus.yml"
        ansible.extra_vars = {
        }
      end
    end

    config.vm.define "ghostApp" do |ghostApp|

      ghostApp.vm.provider :virtualbox do |vb|
    
        vb.name = "ghostApp"
    
        vb.customize ["modifyvm", :id, "--memory", "3072"]
      
        vb.customize ["modifyvm", :id, "--cpus", "3"]
      
        end
      
        ghostApp.vm.network "private_network", ip: "192.168.10.103"
      
        ghostApp.vm.hostname = "ghostApp"
      
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "ghostApp.yml"
          ansible.extra_vars = {
          }
        end
      end
end