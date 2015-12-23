function __fish_docker_compose_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish_docker_compose_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

# Options
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -s f -l file -d "Specify an alternate compose file (default: docker-compose.yml)"
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -s p -l projectname -d "Specify an alternate project name (default: directory name)"
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -l xnetworking -d "(EXPERIMENTAL) Use new Docker networking functionality."
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -l xnetworkdriver -d "DRIVER (EXPERIMENTAL) Specify a network driver (default: "bridge")."
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -l verbose -d "Show more output"
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -s v -l version -d "Print version and exit"

# Subcommands
## build
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a build -d "Build or rebuild services"

## help
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a help -d "Get help on a command"

## kill
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a kill -d "Kill containers"

## logs
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a logs -d "View output from containers"

## pause
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a pause -d "Pause services"

## port
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a port -d "Print the public port for a port binding"

## ps
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a ps -d "List containers"

## pull
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a pull -d "Pulls service images"

## restart
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a restart -d "Restart services"
complete -f -c docker-compose -n '__fish_docker_compose_using_command restart' -s t -l timeout -d "Specify a shutdown timeout in seconds."

## rm
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a rm -d "Remove stopped containers"

## run
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a run -d "Run a one-off command"

## scale
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a scale -d "Set number of containers for a service"
complete -f -c docker-compose -n '__fish_docker_compose_using_command scale' -s t -l timeout -d "Specify a shutdown timeout in seconds."

## start
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a start -d "Start services"

## stop
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a stop -d "Stop services"
complete -f -c docker-compose -n '__fish_docker_compose_using_command stop' -s t -l timeout -d "Specify a shutdown timeout in seconds."

## unpause
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a unpause -d "Unpause services"

## up
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a up -d "Create and start containers"

## version
complete -f -c docker-compose -n '__fish_docker_compose_needs_command' -a version -d "Show the Docker-Compose version information"