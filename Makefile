PROJECT = emqx_persistence_mongo
PROJECT_DESCRIPTION = EMQ X Plugin Template
PROJECT_VERSION = 3.0

DEPS = mongodb
dep_mongodb = git https://github.com/comtihon/mongodb-erlang.git v3.2.0

# BUILD_DEPS = emqx cuttlefish
# dep_emqx = git https://github.com/emqtt/emqttd emqx30
# dep_cuttlefish = git https://github.com/emqx/cuttlefish

BUILD_DEPS = cuttlefish
dep_cuttlefish = git https://github.com/emqx/cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

NO_AUTOPATCH = cuttlefish

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_persistence_mongo.conf -i priv/emqx_persistence_mongo.schema -d data
