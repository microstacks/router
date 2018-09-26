#!/bin/bash

if [[ $LOCALPORT == 3000 ]]
then
  echo "instance connected @ $LOCALHOST:$LOCALPORT"
  echo "server $LOCALHOST:$LOCALPORT;" >> /instances
  echo "Adding instance to Nginx config"
  INSTANCES="$(cat /instances)"
  TEMPLATE="$(cat /template)"
  CONFIG=$(eval "$TEMPLATE")
  echo "$CONFIG" > /config/nginx/site-confs/default
  nginx -s reload
fi