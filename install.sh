#!/bin/bash

packages=(nano curl git gcc net-tools)

# functions
function sleep_2 {
  sleep 2
}

function verify_super_user {
  if [ "$(whoami)" != "root" ]; then
    echo "This script needs to be executed as super user (root)!"
    exit 1
  fi
}

function install_packages {

  verify_super_user

  apt-get update
  
  for package in "${packages[@]}"
  do
    apt-get install $package -y
  done
}

# function install_nvs {
#   export NVS_HOME="$HOME/.nvs"
#   git clone https://github.com/jasongin/nvs "$NVS_HOME"
#   . "$NVS_HOME/nvs.sh" install
# }

# Verify the os and then run the correct function
function run_instalation {
  if [ $so == "windows" ]; then
    echo "Your choice: ${so}"
    sleep_2
    install_packages
    clear
  elif [ $so == "linux" ]; then
    echo "Your choice: ${so}"
    sleep_2
    install_packages
    #install_nvs
    clear
  fi
}

# ask to the user choice on os
function so_question {
  echo "Wich OS are you using?"
  echo "1 - windows"
  echo "2 - linux"
  read so
}

function get_user_input {
  while [ 1 == 1 ]
  do
    so_question
    clear

    if [ $so == "1" ] || [ $so == "windows" ]; then
      so="windows"
      break
    elif [ $so == "2" ] || [ $so == "linux" ]; then
      so="linux"
      break
    else
      echo "invalid input"
      sleep_2
      clear
    fi
  done
}

function main {
  get_user_input
  run_instalation
}

# call the main function and run everything
main