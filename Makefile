envoy_path=./bin/envoy

.PHONY: demo
demo:
	${envoy_path} -c config/demo-static.yaml

.PHONY: run
run:
	${envoy_path} -c config/xds_delta_server_connect.yaml
