#!/bin/bash

apps='yaba-rails-server yaba-react-client'

env_sample_copy () {
  if [ -f "${1}.sample" ]; then
    echo "Copying contents of ${1}.sample to ${1}..."
    cp ${1}.sample ${1}
  else
    echo "File ${1}.sample not found. Skipping copy into ${1}..."
  fi
}

# Run set-up for apps
# Apps will be installed in the same directory as yaba-infrastructure
for app in $apps
do
  cd ..
  if [ -d $app ]; then
    echo "Skipping initialization of $app (already exists)..."
    cd $app
  else
    echo "Initializing $app..."
    mkdir $app
    cd $app
    git init
    git remote add origin git@github.com:domarp-j/"$app".git
    git pull origin master
  fi
  echo "-----------------------------"
done

echo "Running docker-compose build..."
cd ../yaba-infrastructure
docker-compose build
echo "-----------------------------"

echo "Running extra setup for yaba-infrastructure..."
env_sample_copy 'env.list'
echo "-----------------------------"

echo "Running extra setup for yaba-rails-server..."
echo "Setting up & running migrations for database..."
docker-compose run rails-server bundle exec rake db:migrate:reset
echo "-----------------------------"

echo "Running extra setup for yaba-react-client..."
cd ../yaba-react-client
env_sample_copy '.env.local'

echo "Running yarn install on yaba-react-client..."
cd ../yaba-infrastructure
docker-compose run react-client yarn install
echo "-----------------------------"

echo "Done! Run \"docker-compose up\" from within yaba-infrastructure to get started."
