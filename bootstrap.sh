apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant/docroot /var/www
	sed -i "s#DocumentRoot /var/www/html#DocumentRoot /var/www#g" /etc/apache2/sites-available/000-default.conf
fi

apt-get install -y curl

echo "INSTALLING RVM ***&^&&^^&^^^&&&&&&&*******"
pwd
#install rvm & ruby
curl -#LO https://rvm.io/mpapis.asc
gpg --import mpapis.asc
\curl -sSL https://get.rvm.io | bash -s stable
source /usr/local/rvm/scripts/rvm

#install ruby 2.2.3 and make it default
rvm get stable --autolibs=enable
rvm install ruby-2.2.3
rvm --default use ruby-2.2.3
ruby --version

#install nodejs (rails needs it)
 
apt-get -y install nodejs 
echo $PATH
export PATH=$PATH:/usr/bin/node
echo $PATH

#install dev toolset
apt-get install -y libgmp-dev

#check gem manager
gem -v
rvm gemset use global

#to install bundler
gem install bundler
gem list
gem outdated
gem update
#install rails
gem install rails
rvm use ruby-2.2.3@rails4.2 --create
rails -v


#heroku install
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh