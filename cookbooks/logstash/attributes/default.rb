#

default['logstash']['application_logs_path_pattern'] = "/opt/logs/**/*.log"
default['logstash']['payara_logs_path_pattern'] = "/opt/payara/glassfish/domains/domain1/logs/*.log"

# dev server name 'suffix' like
# apl.opoqodev.com
#
default['logstash']['devserversuffixname'] = "apl.opoqodev.com"
default['logstash']['heartbeat_ping_appnames'] = ["administration", "client", "payment"]
