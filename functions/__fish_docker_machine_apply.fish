function __fish_docker_machine_apply -a name
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