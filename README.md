# octoswarm

The new octoswarm using docker

How to install it:

1. Follow the installation instructions for whalebrew - https://github.com/bfirsh/whalebrew
1. Run `rm ~/.bin/octoswarm`
1. Run `ln -nsf $PWD/whalebrew-octoswarm $HOME/.bin/octoswarm`

How to run it:

`octoswarm` has been replaced. Now just use it as a prefix for any docker command, stack, or swarm command.

For example:

`octoswarm stack ensure-cluster`
`octoswarm swarm-follow-instance [container-name]`
