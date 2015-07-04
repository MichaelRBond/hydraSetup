#!/bin/bash

PROJECT_NAME="holt"
BASE_DIR="/vagrant"
PROJECT_DIR="$BASE_DIR/$PROJECT_NAME"
GITDIR="/tmp/git"
GIT_REPO="hydraSetup"
REPO_DIR="$GITDIR/$GIT_REPO"

cd $GITDIR
sudo git clone https://MichaelRBond@github.com/MichaelRBond/$GIT_REPO.git

cd $BASE_DIR
rails new $PROJECT_NAME

cd $PROJECT_DIR
mkdir .bundle
cp $REPO_DIR/railsAppSetup/bundleConfig ./.bundle/config
cp -f $REPO_DIR/railsAppSetup/Gemfile_1 ./Gemfile

rm -f Gemfile.lock

echo "Bundle Install 1"
bundle install

cp -f $REPO_DIR/railsAppSetup/Gemfile_2 ./Gemfile

echo "Bundle Install 2"
rm -f Gemfile.lock

bundle install

echo "Hydra Install"
pwd
rails generate hydra:install
bundle exec rake db:migrate RAILS_ENV=development

echo "Copy over Rails App files"
cp -f $REPO_DIR/railsAppSetup/fedora.yml ./config/fedora.yml
cp -f $REPO_DIR/railsAppSetup/solr.yml ./config/solr.yml

cp -f $REPO_DIR/railsAppSetup/production.rb ./config/environments/production.rb
cp -f $REPO_DIR/railsAppSetup/development.rb ./config/environments/development.rb

cp -f $REPO_DIR/railsAppSetup/routes.rb ./config/routes.rb

cp $REPO_DIR/app/controllers/*.rb ./app/controllers/
cp $REPO_DIR/app/helpers/*.rb ./app/helpers/

mkdir ./app/views/imageviewers
mkdir ./app/views/pages

cp $REPO_DIR/app/views/imageviewers/*.erb ./app/views/imageviewers
echo "Don't forget to modify imageviewers with model information"

cp $REPO_DIR/app/models/newmodel.rb ./app/models/newmodel.rb