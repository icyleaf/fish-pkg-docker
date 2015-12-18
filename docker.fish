function init -a path --on-event init_docker

  set -g docker_machine_status "false"
  set -g docker_machine_name "default"

  function __fish_docker_machine_check
    set docker_machine (docker-machine ls | grep $docker_machine_name | awk '{print $1}')

    if [ $docker_machine = 'default' ]
      set current_status (docker-machine ls | grep $docker_machine_name | awk '{print $4}')
      if [ $current_status = 'Running' ]
        set docker_machine_status true
      end
    end
  end

  function __fish_docker_machine_loading_env
    set docker_machine_default_status (docker-machine status $docker_machine_name)
    if [ $docker_machine_default_status = 'Running' ]
      set docker_machine_variables (docker-machine env $docker_machine_name | grep set)
      for variable in $docker_machine_variables
        set name (echo $variable | awk '{print $3}')
        set value (echo $variable | awk '{print $4}')

        # Change set scope is global to use
        set -gx $name $value
      end
    end
  end

  if available docker
    __fish_docker_machine_check

    if [ $docker_machine_status = "true" ]
      # Loading docker machine env if default is running
      __fish_docker_machine_loading_env
    end
  end

end

