# See → fishshell.com/docs/current/commands.html#complete
function __fish_docker_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish_docker_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_docker_image_names
  set images (docker images | awk '{print $1}' | grep -v REPOSITORY)
  for image in $images
    echo $image
  end
end

function __fish_docker_ps_container_names
  set containers (docker ps -a | awk '{print $1}' | grep -v CONTAINER)
end

function __fish_docker_ps_image_names
  set containers (docker ps -a | awk '{print $2}' | grep -v IMAGE)
end


complete -f -c docker -n '__fish_docker_needs_command' -a attach    -d "Attach to a running container"
complete -f -c docker -n '__fish_docker_needs_command' -a build     -d "Build an image from a Dockerfile"
complete -f -c docker -n '__fish_docker_needs_command' -a commit    -d "Create a new image from a container's changes"
complete -f -c docker -n '__fish_docker_needs_command' -a cp        -d "Copy files/folders between a container and the local filesystem"
complete -f -c docker -n '__fish_docker_needs_command' -a create    -d "Create a new container"
complete -f -c docker -n '__fish_docker_needs_command' -a diff      -d "Inspect changes on a container's filesystem"
complete -f -c docker -n '__fish_docker_needs_command' -a events    -d "Get real time events from the server"
complete -f -c docker -n '__fish_docker_needs_command' -a exec      -d "Run a command in a running container"
complete -f -c docker -n '__fish_docker_needs_command' -a export    -d "Export a container's filesystem as a tar archive"
complete -f -c docker -n '__fish_docker_needs_command' -a history   -d "Show the history of an image"
complete -f -c docker -n '__fish_docker_needs_command' -a images    -d "List images"

# images
complete -f -c docker -n '__fish_docker_needs_command' -a import    -d "Import the contents from a tarball to create a filesystem image"
complete -f -c docker -n '__fish_docker_using_command images' -a '(__fish_docker_image_names)'

complete -f -c docker -n '__fish_docker_needs_command' -a info      -d "Display system-wide information"
complete -f -c docker -n '__fish_docker_needs_command' -a inspect   -d "Return low-level information on a container or image"
complete -f -c docker -n '__fish_docker_needs_command' -a kill      -d "Kill a running container"
complete -f -c docker -n '__fish_docker_needs_command' -a load      -d "Load an image from a tar archive or STDIN"
complete -f -c docker -n '__fish_docker_needs_command' -a login     -d "Register or log in to a Docker registry"
complete -f -c docker -n '__fish_docker_needs_command' -a logout    -d "Log out from a Docker registry"
complete -f -c docker -n '__fish_docker_needs_command' -a logs      -d "Fetch the logs of a container"
complete -f -c docker -n '__fish_docker_needs_command' -a network   -d "Manage Docker networks"
complete -f -c docker -n '__fish_docker_needs_command' -a pause     -d "Pause all processes within a container"
complete -f -c docker -n '__fish_docker_needs_command' -a port      -d "List port mappings or a specific mapping for the CONTAINER"

# ps
complete -f -c docker -n '__fish_docker_needs_command' -a ps        -d "List containers"
complete -f -c docker -n '__fish_docker_using_command ps' -a '(__fish_docker_ps_container_names)'
complete -f -c docker -n '__fish_docker_using_command ps' -s a -l all -d 'Show all containers (default shows just running)'
complete -f -c docker -n '__fish_docker_using_command ps' -s q -d 'Only display numeric IDs'


complete -f -c docker -n '__fish_docker_needs_command' -a pull      -d "Pull an image or a repository from a registry"
complete -f -c docker -n '__fish_docker_needs_command' -a push      -d "Push an image or a repository to a registry"
complete -f -c docker -n '__fish_docker_needs_command' -a rename    -d "Rename a container"
complete -f -c docker -n '__fish_docker_needs_command' -a restart   -d "Restart a container"

complete -f -c docker -n '__fish_docker_needs_command' -a rm        -d "Remove one or more containers"
complete -f -c docker -n '__fish_docker_using_command rmi' -a '(__fish_docker_ps_image_names)'

# rmi
complete -f -c docker -n '__fish_docker_needs_command' -a rmi       -d "Remove one or more images"
complete -f -c docker -n '__fish_docker_using_command rmi' -a '(__fish_docker_ps_container_names)'

complete -f -c docker -n '__fish_docker_needs_command' -a run       -d "Run a command in a new container"
complete -f -c docker -n '__fish_docker_needs_command' -a save      -d "Save an image(s) to a tar archive"
complete -f -c docker -n '__fish_docker_needs_command' -a search    -d "Search the Docker Hub for images"
complete -f -c docker -n '__fish_docker_needs_command' -a start     -d "Start one or more stopped containers"
complete -f -c docker -n '__fish_docker_needs_command' -a stats     -d "Display a live stream of container(s) resource usage statistics"
complete -f -c docker -n '__fish_docker_needs_command' -a stop      -d "Stop a running container"
complete -f -c docker -n '__fish_docker_needs_command' -a tag       -d "Tag an image into a repository"
complete -f -c docker -n '__fish_docker_needs_command' -a top       -d "Display the running processes of a container"
complete -f -c docker -n '__fish_docker_needs_command' -a unpause   -d "Unpause all processes within a container"
complete -f -c docker -n '__fish_docker_needs_command' -a version   -d "Show the Docker version information"
complete -f -c docker -n '__fish_docker_needs_command' -a volume    -d "Manage Docker volumes"
complete -f -c docker -n '__fish_docker_needs_command' -a wait      -d "Block until a container stops, then print its exit code"

