#!/bin/bash
docker run --name es -it -p 2113:2113 -p 1113:1113 -p 1112:1112 -p 2112:2112 mastoj/eventstore --ext-ip="\$eth0" --int-ip="\$eth0" --run-projections=all --add-interface-prefixes=false --ext-http-prefixes="http://*:2113/"
