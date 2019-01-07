#!/bin/bash
set -e


## Parameters
function Usage()
{
  echo "----------------"
  echo "pcf-add-instructor.sh <uaac target> <admin creds> <email address> [-d]"
  echo "pcf-add-instructor.sh uaa.sys.kingcity.cf-app.com admin SzsE5Z0_QbaYlET9_lqtBTdnJsAUy5MU swomack@pivotal.io [-d]"
  echo " "
  echo "  uaac target = example: uaa.system.pcf-apps.net"
  echo "  admin creds = from OpsMgr -> Elastic Runtime -> Credentials -> UAA -> Admin Client Credentials"
  echo "                NOTE: not the 'Admin Credentials'"
  echo "  email address = email address to associate 'instructor' account"
  echo " " 
  echo "options:"
  echo "  -d -- Sets debug mode which echoes commands instead of executing them."
  echo " "
  echo "example: $ pcf-add-instructor uaa.system.pivotal.io b2c12caa8d441f994fc3 bob@pivotal.io -d"
  echo " "
  echo "NOTE: commandline argument positions are important as provided."
  echo "----------------"
}

# DEBUG=1 echoes the command, otherwise run the command
function doCmd()
{
  if [ $DEBUG -eq 1 ]
  then
    echo "DEBUG: $1"
  else
    # actually run the command!
    $1
  fi
}

# check usage
if [[ $# -lt 3 ]] ; then
  Usage
  exit 1
fi

DEBUG=0
if [ "-d" == "$4" ]; then
  echo "*** Setting DEBUG mode to 1"
  echo " "
  DEBUG=1
fi

echo "*** Set API target and log into UAAC CLI..."
doCmd "uaac target $1 --skip-ssl-validation"
doCmd "uaac token client get admin -s $2"
echo " "

echo "*** Add 'instructor' user and permissions"
doCmd "uaac user add instructor -p pivotal1 --emails $3"
echo " "

# add permissions
doCmd "uaac member add cloud_controller.admin instructor"
doCmd "uaac member add uaa.admin instructor"
doCmd "uaac member add scim.read instructor"
doCmd "uaac member add scim.write instructor"
echo " "

echo "New user 'instructor' created."
echo "Login as 'instructor/pivotal1' and create org/spaces"
echo " "
