function init -a path --on-event init_docker

  if not set -q DOCKER_DEBUG_MODE
    set DOCKER_DEBUG_MODE "false"
  end

  if not set -q DOCKER_DEFAULT_MACHINE
    set DOCKER_DEFAULT_MACHINE "default"
  end

  set -g DOCKER_MACHINE_STATUS
  set -g DOCKER_MACHINES


  function __fish_docker_machines
    set DOCKER_MACHINES (docker-machine ls | grep -v "NAME" | awk '{print $1}')
  end

  function __fish_docker_machine_check -a name
    set current_status (docker-machine ls | grep $name | awk '{print $4}')
    if [ $current_status = "Running" ]
      return 10
    else
      return 0
    end
  end

  function __fish_docker_machine_loading_env -a name
    set docker_machine_default_status (docker-machine status $name)
    if [ $docker_machine_default_status = "Running" ]
      set docker_machine_variables (docker-machine env $name | grep set)
      for variable in $docker_machine_variables
        set name (echo $variable | awk '{print $3}')
        set value (echo $variable | awk '{gsub("\"", "", $4); gsub(";", "", $4); print $4}')

        # Change set scope is global to use
        set -gx $name $value
      end
    end
  end

  if available docker
    __fish_docker_machine_check $DOCKER_DEFAULT_MACHINE
    if [ $status -eq 10 ]
      # Loading docker machine env if default is running
      __fish_docker_machine_loading_env $DOCKER_DEFAULT_MACHINE
    end
  end

end

