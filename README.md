# Yaba Infrastructure

Setup & local container management for yaba (Yet Another Budget App)

This app manages the following:
- [yaba-rails-server](https://github.com/domarp-j/yaba-rails-server) - The Rails server API
- [yaba-react-client](https://github.com/domarp-j/yaba-react-client) - The React client

## Setup

Run `./setup.sh` from within this repository. The following will happen:
- The apps will be cloned into directories alongside `yaba-infrastructure`
- Docker images will be built for the apps
- Some extra setup will run depending on the app (database migrations, library setup, etc)

Once the setup step is complete, run `docker-compose up` from within the `yaba-infrastructure` repository, and you'll be good to go!

