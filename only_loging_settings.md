
1.Firstly add (/var/lib/pgsql/data/postgresql.conf)
2.Restart PostgreSQL
3.Set permissons of copy_logs.sh
3.RUN copy_logs.sh

###############################################################################

log_connections = on
log_disconnections = on

# Example:
# LOG: connection received: host=::1 port=60722
# LOG: connection authorized: user=miholeus database=parsers
# LOG: connection received: host=::1 port=60724
# LOG: connection authorized: user=miholeus database=neuronetwork

################################################################################

log_statement = 'all'

# ddl - logging of database schema change
# mod - is the same as ddl + data modification operations on rows in the table
# all - too, that mod + all select queries to the database

################################################################################

log_line_prefix = '%t &lt;%d %u %r&gt; %%'

# t — timestamp
# d — name_data_base
# u — user
# r — remote_host_port
# % — %

# Example result:
#
#        timestamp           database     user      host : port                  SQL-Injection
#
# 2016-03-23 21:57:16 MNSK | &lt;test | miholeus | ::1(61080)&gt; %LOG:&nbsp; | statement: ALTER TABLE "public"."t" DROP COLUMN "flag";

#################################################################################

log_min_messages = LOG
#client_min_messages = NOTICE
#log_min_error_statement = ERROR

#################################################################################

# /var/lib/pgsql/x.x/data/pg_log/

log_directory = 'pg_log'

#################################################################################
