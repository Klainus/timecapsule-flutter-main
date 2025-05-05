cov: 
	very_good test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
f:
	dart run build_runner build --delete-conflicting-outputs
get:
	very_good packages get -r
t: 
	very_good test -r
api:
	@cd packages/app_api && make api