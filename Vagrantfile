# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 8080
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo aptitude -y update
    sudo aptitude -y full-upgrade
    sudo aptitude -y install git autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev default-jre

    echo "mysql-server-5.5 mysql-server/root_password password root" | sudo debconf-set-selections
    echo "mysql-server-5.5 mysql-server/root_password_again password root" | sudo debconf-set-selections 
    sudo aptitude -y install mysql-server mysql-client libmysqlclient-dev

    git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
    echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
    echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
    git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
    echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc

    export PATH="/home/vagrant/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    rbenv install 2.2.0
    rbenv global 2.2.0
    gem install bundler
    cd /vagrant
    bundle install
    bundle exec rake db:create db:migrate
    bundle exec rails s -d -p 3000
  SHELL
end

