sudo su
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git -y && sudo apt-get install wget -y
sudo apt-get install make -y
sudo apt-get install postgresql postgresql-contrib libpq-dev -y
sudo apt-get install nodejs -y
sudo apt-get install nginx -y
sudo apt-get install vim -y

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
tar -xzvf ruby-install-0.6.1.tar.gz
cd ruby-install-0.6.1/
sudo make install

cd ../../ && rm -rf chruby-0.3.9/

ruby-install ruby-2.3.0
cd 
rm .bashrc
curl https://gist.githubusercontent.com/igolden/14886c5371bafc5dffe17a4072755127/raw/148a8ba0058c0d3e818a29d9cb07c498fd479763/.bashrc.local >> .bashrc.local 
curl https://gist.githubusercontent.com/igolden/14886c5371bafc5dffe17a4072755127/raw/148a8ba0058c0d3e818a29d9cb07c498fd479763/.bashrc >> .bashrc

exec $SHELL

gem install bundler
