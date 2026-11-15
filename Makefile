.PHONY: install build serve dev clean new list plugins help

SITEMAKER := $(shell command -v sitemaker 2>/dev/null || echo "$(shell go env GOPATH)/bin/sitemaker")
PKG       := github.com/ericevans16/sitemaker@v0.1.2

help:
	@echo "Blog Management Commands (powered by sitemaker):"
	@echo "  make install  - Install / upgrade sitemaker CLI from GitHub"
	@echo "  make build    - Build the static site into public/"
	@echo "  make serve    - Build & start local preview server with live-reload"
	@echo "  make dev      - Preview locally including draft posts"
	@echo "  make new      - Create a new Markdown post (make new SLUG=my-post)"
	@echo "  make list     - List all posts and their status"
	@echo "  make clean    - Remove public/ directory"

install:
	@go install $(PKG)

$(SITEMAKER):
	@go install $(PKG)

build: $(SITEMAKER)
	@$(SITEMAKER) build

serve: $(SITEMAKER)
	@$(SITEMAKER) serve

dev: $(SITEMAKER)
	@$(SITEMAKER) serve --drafts

new: $(SITEMAKER)
	@$(SITEMAKER) new $(SLUG)

list: $(SITEMAKER)
	@$(SITEMAKER) list

plugins: $(SITEMAKER)
	@$(SITEMAKER) plugins

clean:
	@rm -rf public
	@echo "Cleaned public/."
