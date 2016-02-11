#!/bin/bash
/usr/local/bin/uwsgi --emperor /etc/uwsgi/vassals --uid www-data --gid www-data --daemonize /dev/stdout
/usr/sbin/nginx -g "daemon off;"