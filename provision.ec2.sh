echo "Installing tools"

PROJECT_NAME=seekerlocal
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git -y && sudo apt-get install wget -y
sudo apt-get install make -y
sudo apt-get install postgresql postgresql-contrib libpq-dev -y
sudo apt-get install ruby ruby-dev ruby2.3-dev -y
sudo apt-get install nodejs -y
sudo apt-get install nginx -y
sudo apt-get install vim -y
sudo apt-get install libgmp3-dev

gem install bundler
gem install rake

echo "Starting env setup.. "

sudo useradd -d /home/deploy -m deploy
sudo useradd -d /home/deploy -m deploy
sudo usermod -s /bin/bash deploy

mkdir $PROJECT_NAME
mkdir -p $PROJECT_NAME/shared/config
touch $PROJECT_NAME/.env

cat <<EOT >> $PROJECT_NAME/shared/config/database.yml
production:
  adapter: postgresql
  encoding: unicode
  database: `${PROJECT_NAME}_production`
  username: $PROJECT_NAME
  password: $PROJECT_NAME
  host: localhost
  port: 5432

EOT

sudo -u postgres createuser -s $PROJECT_NAME
sudo -u postgres psql

echo "---------------------------------------------------------------"
echo "| YOU STILL NEED TO CREATE A DB"
echo "| sudo -u postgres createdb -O project project_production"
echo "| "
echo "| YOU STILL NEED TO MAKE DEPLOY SUDO"
echo "| sudo visudo and add 'deploy ALL=(ALL:ALL) ALL'"
echo "| "
echo "| YOU STILL NEED TO GENERATE SSH FOR DEPLOY, ADD TO GITHUB"
echo "| ssh-keygen && cat .ssh/id_rsa.pub"
echo "| "
echo "| LASTLY, ADD YOUR PERSONAL KEY TO INSTANCE"
echo "| sudo vim .ssh/authorized_keys"
echo "---------------------------------------------------------------"
