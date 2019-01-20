#!/bin/bash

if [[ $LOCALPORT == $PORT ]]
then
  echo "Instance disconnected @ $LOCALHOST:$LOCALPORT"
  sed -i "/server $LOCALHOST:$LOCALPORT;/d" /.stack/app/servers 
  echo "Remove instance to Nginx config"
  nginx -s reload
fi
