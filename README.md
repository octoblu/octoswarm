# octoswarm

The new octoswarm using docker

## Installation

1. Run `./uninstall-old`
2. Run `./install`

## Usage

- `machine-templates` and `machine` directories are obsolete. Use the directory `docker-machine`.
- `octoswarm` must run inside of a stack with a `cluster.json`
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
