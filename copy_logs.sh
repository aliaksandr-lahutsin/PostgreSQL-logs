#!/bin/sh

# Automatic copy script to spacial path without restart postgresql

# add permission for copy logs
sudo chmod 755 -R /var/lib/pgsql/

# create folder to storage logs if does not exist
sudo mkdir -p /opt/pgsql_logs

# copy all logs to folder with overwrite
sudo cp -rf /var/lib/pgsql/data/pg_log/* /opt/pgsql_logs/

# rewrite permission to folder for correct reload
sudo chmod 700 -R /var/lib/pgsql/

# remove special symbols in log files
sudo sed -i 's/\&lt;//g' /opt/pgsql_logs/*.log
sudo sed -i 's/\&amp;//g' /opt/pgsql_logs/*.log
sudo sed -i 's/\&gt;//g' /opt/pgsql_logs/*.log
sudo sed -i 's/gt;//g' /opt/pgsql_logs/*.log

# remove spaces and tabs
sudo sed -i "s/[[:space:]]\+/ /g" /opt/pgsql_logs/*.log
