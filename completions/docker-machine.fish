function __fish_docker_machine_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish_docker_machine_using_command
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

# Options
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l debug -s D -d "Enable debug mode"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -s s -l storagepath -d "Configures storage path [$MACHINE_STORAGE_PATH]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l tlscacert -d "CA to verify remotes against [$MACHINE_TLS_CA_CERT]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l tlscakey -d "Private key to generate certificates [$MACHINE_TLS_CA_KEY]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l tlsclientcert -d "Client cert to use for TLS [$MACHINE_TLS_CLIENT_CERT]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l tlsclientkey -d "Private key used in client TLS auth [$MACHINE_TLS_CLIENT_KEY]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l githubapitoken -d "Token to use for requests to the Github API [$MACHINE_GITHUB_API_TOKEN]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l nativessh -d "Use the native (Go-based) SSH implementation. [$MACHINE_NATIVE_SSH]"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l help -s h -d "show help"
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -l version -s v -d "print the version"

# Subcommands
## active	Print which machine is active
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a active -d "Print which machine is active"

## config	Print the connection config for machine
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a config -d "Print the connection config for machine"

## create	Create a machine.
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a create -d "Create a machine."

## env
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a env -d "Display the commands to set up the environment for the Docker client"
complete -f -c docker-machine -n '__fish_docker_machine_using_command env' -a '(__fish_docker_machine_names)'

## inspect
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a inspect -d "Inspect information about a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command inspect' -a '(__fish_docker_machine_names)'

## ip
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a ip -d "Get the IP address of a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command ip' -a '(__fish_docker_machine_names)'

## kill
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a kill -d "Kill a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command kill' -a '(__fish_docker_machine_names)'

## ls
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a ls -d "List machines"

## restart
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a restart -d "Restart a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command restart' -a '(__fish_docker_machine_names)'

## rm
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a rm -d "Remove a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command rm' -a '(__fish_docker_machine_names)'

## ssh
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a ssh -d "Log into or run a command on a machine with SSH."
complete -f -c docker-machine -n '__fish_docker_machine_using_command ssh' -a '(__fish_docker_machine_names)'

## scp
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a scp -d "Copy files between machines"
complete -f -c docker-machine -n '__fish_docker_machine_using_command scp' -a '(__fish_docker_machine_names)'

## start
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a start -d "Start a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command start' -a '(__fish_docker_machine_names)'

## status
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a status -d "Get the status of a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command status' -a '(__fish_docker_machine_names)'

## stop
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a stop -d "Stop a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command stop' -a '(__fish_docker_machine_names)'

## upgrade
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a upgrade -d "Upgrade a machine to the latest version of Docker"
complete -f -c docker-machine -n '__fish_docker_machine_using_command upgrade' -a '(__fish_docker_machine_names)'

## url
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a url -d "Get the URL of a machine"
complete -f -c docker-machine -n '__fish_docker_machine_using_command url' -a '(__fish_docker_machine_names)'

## help
complete -f -c docker-machine -n '__fish_docker_machine_needs_command' -a help -d "Shows a list of commands or help for one command"