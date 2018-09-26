#!/bin/bash

if [[ $LOCALPORT == 3000 ]]
then
  echo "Instance disconnected @ $LOCALHOST:$LOCALPORT"
  sed -i "/server $LOCALHOST:$LOCALPORT;/d" /instances 
  echo "Remove instance to Nginx config"
  INSTANCES="$(cat /instances)"
  TEMPLATE="$(cat /template)"
  CONFIG=$(eval "$TEMPLATE")
  echo "$CONFIG" > /config/nginx/site-confs/default
  nginx -s reload
fi