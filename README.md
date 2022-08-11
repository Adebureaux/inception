# USEFULL COMMANDS TO LIST AND DELETE IMAGES AND CONTAINERS

- docker ps -a                # Lists containers (and tells you which images they are spun from)
- docker images               # Lists images 
- docker rm <container_id>    # Removes a stopped container
- docker rm -f <container_id> # Forces the removal of a running container (uses SIGKILL)
- docker rmi <image_id>       # Removes an image 
- docker rmi -f <image_id>    # Forces removal of image even if it is referenced in multiple repositories, 
