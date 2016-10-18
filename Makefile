all: gem cargo npm
.PHONY: all

cargo:
	@echo "[+] publishing to crates.io"
	@cargo package
	@cargo publish
.PHONY: cargo

gem:
	@echo "[+] publishing to ruby gems"
	$(eval file := $(shell gem build eclectica.gemspec | grep -o 'eclectica-[0-9].[0-9].[0-9].gem'))
	@gem push $(file)
.PHONY: gem

npm:
	@echo "[+] publishing to npm"
	@npm publish
.PHONY: npm
