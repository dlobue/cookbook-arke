
default.arke.service_action = :start
default.arke.plugin_dir = '/etc/arke/plugins'
default.arke.config_file = '/etc/arke/arke.conf'

default.arke.backend = 'http'
default.arke.backend_host = 'localhost'
default.arke.backend_port = Promise.new {
    (attribute?("clio") and clio.attribute?("port")) ? clio.port : 64000
}

default.arke.region_limit = true

default.arke.has_mongodb = false

default.arke.mongodb_host = 'localhost'
default.arke.mongodb_port = Promise.new { attribute?("mongodb") and mongodb.attribute?("port") ? mongodb.port : nil }

default.arke.has_postgres_repl = false
default.arke.pg_repl_hosts = 'localhost'
default.arke.pg_repl_port = 5432
default.arke.pg_repl_user = 'postgres'

