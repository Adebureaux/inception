#!/bin/bash

docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc) 2> /dev/null
sudo rm -rf /home/$USER/data
