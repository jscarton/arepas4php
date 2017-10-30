# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  dir = File.dirname(File.expand_path(__FILE__)) #actual directory

  #------------------------------------------------------------------------------------
  # CUSTOM PROVISION
  #------------------------------------------------------------------------------------

  config.vm.box = "centos/7"

  # Box Name
  config.vm.hostname="arepas.php"

  config.vm.provision :shell, path: "arepas/arepas_installer.sh"

  config.vm.provision :shell, path: "arepas/arepas_boot.sh", run: "always"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end



  # NETWORKING
  config.vm.network "private_network", ip: "192.168.56.152"

  #SYNC
  config.vm.synced_folder "./arepas", "/home/vagrant/arepas"
  config.vm.synced_folder "./projects", "/var/www/projects", owner: "vagrant", group: "vagrant", mount_options: ["dmode=777,fmode=777"]


  #------------------------------------------------------------------------------------
  # VAGRANT PLUGINS
  #------------------------------------------------------------------------------------
  required_plugins = %w(vagrant-hostmanager)

  plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
  if not plugins_to_install.empty?
    puts "Installing plugins: #{plugins_to_install.join(' ')}"
    if system "vagrant plugin install #{plugins_to_install.join(' ')}"
      exec "vagrant #{ARGV.join(' ')}"
    else
      abort "Installation of one or more plugins has failed. Aborting."
    end
  end

  #------------------------------------------------------------------------------------
  # HOST MANAGER
  #------------------------------------------------------------------------------------

  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = false
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = %w(arepas.php)
  end

  #------------------------------------------------------------------------------------
  # MESSAGE OF THE DAY
  #------------------------------------------------------------------------------------
  case ARGV[0]
    when "provision", "up"
      contents = File.open("#{dir}/MOTD.md", 'r'){ |file| file.read }
      puts "\n#{contents}\n"
  end  
end
