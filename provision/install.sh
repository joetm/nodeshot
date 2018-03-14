#!/bin/bash
#
#
#Install VIVO.
#
#

export DEBIAN_FRONTEND=noninteractive
#Exit on first error
set -e
#Print shell commands
set -o verbose

#
# -- Setup nodeshot
#



#Make data directory
# mkdir -p $DATADIR



installNodeshot(){
    git clone git@github.com:ninuxorg/nodeshot.git
    cd nodeshot

    # Install the required python packages
    pip install -r requirements.txt

    # install nodeshot
    python setup.py develop

    nodeshot startproject dev && cd dev
    return $TRUE
}


apt-get update --fix-missing

# dependencies
apt-get install python-software-properties software-properties-common build-essential libxml2-dev python-setuptools python-virtualenv python-dev binutils libjson0-dev libjpeg-dev libffi-dev libpq-dev
# dev packages
apt-get install wget git

apt-get install postgis* libproj-dev gdal-bin libgdal1-dev python-gdal

# TODO
# sudo su postgres
# createdb nodeshot
# psql nodeshot
# CREATE EXTENSION postgis;
# CREATE EXTENSION hstore;
# CREATE USER nodeshot WITH PASSWORD 'your_password';
# ALTER USER nodeshot SUPERUSER;
# exit


pip install virtualenvwrapper

echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
source ~/.bashrc

mkvirtualenv nodeshot

pip install -U setuptools pip wheel

# install the app
installNodeshot

#Adjust nodeshot config
setupNodeshot


echo Nodeshot installed.


# Project configuration
# TODO


exit

