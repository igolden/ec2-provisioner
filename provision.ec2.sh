echo "Installing tools"

PROJECT_NAME=flagsilk
USERNAME=igolden
REPO=

# setup yarn and nodejs for webpacker
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# update ubuntu
sudo apt-get update && sudo apt-get upgrade -y

# install system dependencies
sudo apt-get install git-core curl zlib1g-dev build-essential \
                     libssl-dev libreadline-dev libyaml-dev   \
                     libsqlite3-dev sqlite3 libxml2-dev       \
                     libxslt1-dev libcurl4-openssl-dev        \
                     software-properties-common libffi-dev    \
                     nodejs yarn vim wget -y

# install ruby dependencies
gem install bundler
gem install rake


echo "---------------------------------------------------------------"
echo "| YOU STILL NEED TO CREATE A DB"
echo "| sudo -u postgres createdb -O project project_production"
echo "| "
echo "| SET PASSWORD TO DB USER"
echo "| sudo postgres psql"
echo "| $> \password USER"
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
