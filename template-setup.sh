#!/bin/bash

echo "Setting up Template"

# @TODO : these should be put in a separate file and sourced from hydra/template-setup.sh

## Uncomment project name line to use it locally. Better put in global for setup (from bootstrap.sh)
#PROJECT_NAME="holt"
BASE_DIR="/vagrant"
PROJECT_DIR="$BASE_DIR/$PROJECT_NAME"
GITDIR="/tmp/git"
GIT_REPO="hydraSetup"
REPO_DIR="$GITDIR/$GIT_REPO"

# Change the application layout in /app/controllers/application_controller.rb
sed -i "s@layout 'blacklight'@layout '$PROJECT_NAME'@" $PROJECT_DIR/app/controllers/application_controller.rb

# Remove line 15 //= require turbolinks of application.js at /app/assets/javascripts/
sed -i "s@//= require turbolinks@@g" $PROJECT_DIR/app/assets/javascripts/application.js

# copy files
cp $REPO_DIR/templates/basic-2015/collectiontitle.html $PROJECT_DIR/app/views/layout/$PROJECT_NAME.html.erb
cp $REPO_DIR/templates/basic-2015/collectiontitle.js $PROJECT_DIR/app/assets/javascripts/$PROJECT_NAME.js
cp $REPO_DIR/templates/basic-2015/collectiontitle.css.scss $PROJECT_DIR/app/assets/stylesheets/$PROJECT_NAME.css.scss
cp $REPO_DIR/templates/basic-2015/variables.css.scss $PROJECT_DIR/app/assets/stylesheets/variables.css.scss
cp $REPO_DIR/templates/basic-2015/wvrhc.css.scss $PROJECT_DIR/app/assets/stylesheets/wvrhc.css.scss
cp $REPO_DIR/templates/basic-2015/wvu.css.scss $PROJECT_DIR/app/assets/stylesheets/wvu.css.scss

cp $REPO_DIR/templates/basic-2015/images/* $PROJECT_DIR/app/assets/images/

mkdir -p $PROJECT_DIR/app/views/catalog
touch $PROJECT_DIR/app/views/catalog/_home_text.html.erb
echo "<h2>About the Collection</h2>" > $PROJECT_DIR/app/views/catalog/_home_text.html.erb
