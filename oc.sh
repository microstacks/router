#!/bin/bash

if [[ $LOCALPORT == $PORT ]]
then
  echo "instance connected @ $LOCALHOST:$LOCALPORT"
  echo "server $LOCALHOST:$LOCALPORT;" >> /.stack/app/servers
  echo "Adding instance to Nginx config"
  nginx -s reload
  touch /.stack/app/servers.html
fi

