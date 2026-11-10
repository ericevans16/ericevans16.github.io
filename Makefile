.PHONY: build serve dev clean new help

help:
	@echo "RainHush Blog Management Commands:"
	@echo "  make build  - Build the static site into public/"
	@echo "  make serve  - Build and start local preview server (port 8080)"
	@echo "  make dev    - Alias for make serve"
	@echo "  make clean  - Remove generated public/ directory"
	@echo "  make new    - Create a new Markdown post template in content/posts/"

build:
	@go build -o rainhush .
	@./rainhush build

serve dev:
	@go build -o rainhush .
	@./rainhush test

clean:
	@rm -rf public
	@echo "public/ directory removed."

new:
	@bash scripts/new-post.sh
