# fishday
Ruby on Rails

## Deployment Referent Document
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04

### Additional Command
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

gem install bundler
gem update --system

sudo usermod -aG sudo,adm mr7elmi
/etc/profile.d/rbenv.sh
/etc/puma.conf
/etc/nginx/sites-enabled

## Local setting
locale-gen en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

## DB Seed
RAILS_ENV=production bundle exec rake db:seed