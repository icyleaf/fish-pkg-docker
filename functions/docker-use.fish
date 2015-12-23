function docker-use -a name -a '(__fish_docker_machines) '-d "Switch docker machine"
  __fish_docker_machines

  if [ -z $name ]
    echo "Please set docker machine name to switch!"
  else
    set is_found "false"
    for n in $DOCKER_MACHINES
      if [ $n = $name ]
        set is_found "true"
        break
      end
    end

    if [ $is_found = "true" ]
      docker-machine start $name
      echo "Success to switch."
      __fish_docker_machine_loading_env $name
    else
      echo "Not found docker machine: $name"
    end
  end
end