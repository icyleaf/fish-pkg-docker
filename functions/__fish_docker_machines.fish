function __fish_docker_machines
  set -g DOCKER_MACHINES (docker-machine ls | grep -v "NAME" | awk '{print $1}')
end