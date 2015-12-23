function __fish_docker_use_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish_docker_use_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_docker_machine_names
  for name in (docker-machine ls | grep -v "NAME" | awk '{print $1}')
    echo $name
  end
end

complete -f -c docker-use -n '__fish_docker_use_needs_command' -a '(__fish_docker_machine_names)'
