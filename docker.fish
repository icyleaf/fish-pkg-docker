function init -a path --on-event init_docker

  if not set -q DOCKER_DEBUG_MODE
    set DOCKER_DEBUG_MODE "false"
  end

  if not set -q DOCKER_DEFAULT_MACHINE
    set DOCKER_DEFAULT_MACHINE "default"
  end

  __fish_docker_machines

  function __fish_docker_machine_check -a name
    set current_status (docker-machine ls | grep $name | awk '{print $4}')
    if [ $current_status = "Running" ]
      return 200
    else
      return 404
    end
  end

  if available docker
    __fish_docker_machine_check $DOCKER_DEFAULT_MACHINE
    if [ $status -eq 200 ]
      # Loading docker machine env if default is running
      __fish_docker_machine_apply $DOCKER_DEFAULT_MACHINE
    end
  end

end

