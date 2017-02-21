# octoswarm

The new octoswarm using docker

## Installation

1. Run `./uninstall-old`
2. Run `./install`

## Important Changes

- `machine-templates` and `machine` directories are obsolete. Use the directory `docker-machine`.
- `octoswarm` must run inside of a stack with a `cluster.json`
- You will need the project `octoswarm-stack`. `swarm-prod` and `swarm-smart` are now obsolete.
- All services now have a `[service-name].env` file in `env.d` which replaces the `env.d/[service-name]/[env...]` structure.
- These commands have changed/added:
  - `octoswarm` - replaces octoswarm tmux enviroment
  - `octostack` - replaces `stack *`
  - `octodocker` - replaces octoswarm tmux and `docker *`
  - `octomachine` - replaces octomachine tmux and `docker-machine *`
  - `octobash` - replaces octomachine tmux
  - `octostack follow-instance` - replaces `swarm-follow-instance`
  - `octostack exec-instance` - replaces `swarm-exec-instance`
  - `octoswarm swarm-generate-machine-id` - replaces `swarm-generate-machine-id`
  - `octoswarm swarm-get-latest-docker-url` - replaces `swarm-get-latest-docker-url`
  - `octoswarm swarm-join-manager` - replaces `swarm-join-manager`
  - `octoswarm swarm-join-worker` - replaces `swarm-join-worker`
  - `octostack ensure-cluster` - no longer creates a stack
  - `octostack create-cluster` - must be used to create a stack
  - `octostack ensure-service <service-name>`
    - now uses `--env-file` for `docker service create`
    - now uses a smart (possibly too smart) detection of env variables
  - `stack initialize` has been removed
