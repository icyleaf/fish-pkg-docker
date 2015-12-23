function docker-current -d "Show current used docker machine"
  __fish_docker_machines

  if not set -q DOCKER_MACHINE_NAME
    echo "No machine is used. (execute `docker-use name` to switch that you want machine)"
  else
    for machine in $DOCKER_MACHINES
      set is_found "false"
      for n in $DOCKER_MACHINES
        if [ $n = $DOCKER_MACHINE_NAME ]
          set is_found "true"
          break
        end
      end
    end

    if [ $is_found = "true" ]
      set machine_status (docker-machine ls | grep $DOCKER_MACHINE_NAME | awk '{print $4}')
      set machine_ip (echo $DOCKER_HOST | awk '{split($0, a, ":"); gsub("//", "", a[2]); print a[2]}')

      echo "Name: $DOCKER_MACHINE_NAME"
      echo "IP: $machine_ip"
      echo "Status: $machine_status"
    else
      echo "Not found machine: $DOCKER_MACHINE_NAME"
    end
  end
end