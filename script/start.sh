#!/bin/bash
# Start supervisord and services
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
