![][license-badge]

# docker

Automate loading `default` docker-machine environment and add missing tab completion for Fish Shell.

By default, developer always call `eval (docker-machine env default)` during open a new terminal window(tab),
this plugins will automate call the command that you can use `docker` command in anywhere. of cause, here is
a variable to set to change default machine name:

```fish
# File: ~/.config/fish/config.fish

set -gx DOCKER_DEFAULT_MACHINE "dev"

# Load wa/omf init script
```

Tab completion just added basic subcommand description. enjoy it.

Works for [Wahoo][Wahoo-link]/[Oh My Fish][omf-link].

## Install

```fish
# wahoo
$ wa g https://github.com/icyleaf/fish-pkg-docker
# oh-my-fish
$ omf install https://github.com/icyleaf/fish-pkg-docker
```

## Functions

function | description
---|---
docker-current | Show current used docker machine
docker-use | Switch docker machine

# License

[MIT][mit] © [icyleaf][author]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/icyleaf

[wahoo-link]:     https://www.github.com/wa/wahoo
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square