all: clean gem npm pip cargo clean
.PHONY: all

clean:
	@rm -rf eclectica-*.gem eclectica.egg-info dist Cargo.lock target dist
.PHONY: clean

cargo:
	@echo "[+] publishing to crates.io"
	@cargo package
	@cargo publish
.PHONY: cargo

gem:
	@echo "[+] publishing to ruby gems"
	$(eval file := $(shell gem build eclectica.gemspec | grep -o -E 'eclectica-[0-9]+.[0-9]+.[0-9]+.gem'))
	@gem push $(file)
.PHONY: gem

npm:
	@echo "[+] publishing to npm"
	@npm publish
.PHONY: npm

pip:
	@echo "[+] publishing to pypi"
	@python setup.py sdist upload -r pypi
.PHONY: pip
