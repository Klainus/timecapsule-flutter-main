cov: 
	very_good test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
f:
	dart run build_runner build --delete-conflicting-outputs
get:
	very_good packages get -r

api:
	openapi-generator generate -i openapi_schema.yaml -g dart-dio -c openapi_generator_config.yaml --enable-post-process-file
	make f
	dart format .