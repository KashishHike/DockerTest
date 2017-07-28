#!/bin/bash

echo `whoami`
homedir=$( getent passwd "$USER" | cut -d: -f6 )

# Since docker do not know about relative paths so we are going to context of this directory
MYWORKINGDIR=${PWD}
parentDir=`dirname $MYWORKINGDIR`

HOST_IP=$(hostname --ip-address)

# Install docker
if [ "$(uname)" == "Darwin" ]; then
       # For Mac OS X
       echo "There is no installation for MAC users here. Install docker manually"
       ENV_VARIABLE_FILE="$HOME/.bash_profile"
       exit 0
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ] && ! [ -x "$(command -v docker)" ]; then
       # For Ubuntu 14.04
       bash docker-install-ubuntu.bash

       echo "Installing docker compose"
       bash compose-install.sh
elif [ "$(expr substr $(uname -s) 1 5)" != "Linux" ] && [ "$(uname -s)" != "Darwin" ]; then
       echo "we support only mac and linux as of now. Keep watching for windows support"
       exit 0
fi

