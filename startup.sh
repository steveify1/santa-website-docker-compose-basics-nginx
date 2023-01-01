#!/bin/bash

pm2 start npm --name webserver -- start;
nginx -g "daemon off;";