#

default['logstash']['application_logs_path_pattern'] = "/opt/logs/**/*.log"
default['logstash']['payara_logs_path_pattern'] = "/opt/payara/glassfish/domains/domain1/logs/*.log"
default['logstash']['oracle_logs_path'] = "/var/log/otherlog/oracle-a2"
default['logstash']['oracle_logview_user'] = "logview"
default['logstash']['oraclelog_server_ip'] = "10.2.2.61"

# dev server name 'suffix' like
# apl.opoqodev.com
#
default['logstash']['devserversuffixname'] = "apl.opoqodev.com"
default['logstash']['heartbeat_ping_appnames'] = ["administration", "client", "payment"]
