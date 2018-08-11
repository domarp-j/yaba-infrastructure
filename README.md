# Yaba Infrastructure

This service sets up yaba (Yet Another Budget App) for local development. It sets up and manages the following apps:
- [yaba-rails-server](https://github.com/domarp-j/yaba-rails-server)
- [yaba-react-client](https://github.com/domarp-j/yaba-react-client)

## Setup

Run `./setup.sh` from within this repository. The following will happen:
- The apps above will be cloned into directories alongside `yaba-infrastructure`
- Docker images will be built for the apps
- Some extra setup steps will run depending on the app (database migrations, library installations, etc)

Once the setup step is complete, run `docker-compose up` from within the `yaba-infrastructure` repository, and you'll be good to go!

