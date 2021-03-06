# yaba (Yet Another Budget App) - Infrastructure

This service sets up yaba (Yet Another Budget App) for local development. It sets up and manages the following apps:
- [yaba-rails-server](https://github.com/domarp-j/yaba-rails-server)
- [yaba-react-client](https://github.com/domarp-j/yaba-react-client)

## Setup

1. Install [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/)
2. Create a new directory that will store all of the yaba apps
3. Clone `yaba-infrastructure` into this directory
4. `cd` into `yaba-infrastructure`
5. (Optional) Copy `env.list` from `env.list.sample`, modifying values in the `.list` file as needed
6. Run `./setup.sh`, which does the following:
    - Clones all of the required apps into the directory you just created
    - Builds the Docker images for each app
    - Runs some extra setup steps for each app (database migrations, library installations, etc)
7. Run `docker-compose up` from within the `yaba-infrastructure` repository, and you'll be good to go!

