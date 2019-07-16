lint:
	npx eslint --ignore-pattern *.min.js *.js

publish:
	if git ls-remote --exit-code origin &>/dev/null; then git push -u -f --tags origin master; fi
	npm publish
	npm i -g .

deps:
	rm -rf node_modules
	npm i

update:
	npx updates -cu
	$(MAKE) deps

patch:
	$(MAKE) lint
	npx ver -c 'node build.js' patch
	$(MAKE) publish

minor:
	$(MAKE) lint
	npx ver -c 'node build.js' minor
	$(MAKE) publish

major:
	$(MAKE) lint
	npx ver -c 'node build.js' major
	$(MAKE) publish

.PHONY: lint publish update patch minor major
