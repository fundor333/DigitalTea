.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

send_webmention: ## Send webmention from feed
	@pushl -c $HOME/.config/pushl-cache https://fundor333.com/index.xml

develop: ## Run the site localy
	hugo server  --minify --disableFastRender

developfuture: ## Run the site localy with all the future article
	hugo server  --minify --disableFastRender --buildFuture

developall: ## Run the site localy with all the article, future or drafts
	hugo server  --minify --disableFastRender --buildFuture --buildDrafts

.PHONY: syntax
syntax: ## Build the style of the code
	hugo gen chromastyles --style=dracula > themes/fugu/assets/css/_syntax.scss

cache: ## Clean the cache
	hugo --gc

clean: syntax cache ## Clean the directory of the project of chache e meta file and other things

.PHONY: run
run: clean  ## Build the site cleaning all
	@hugo --minify

.PHONY: new
new: ## Make new object for the blog
	python make-post.py

deploy: ## Ready to deploy
	@hugo --minify

brodcast: clean ## Brodcast the site
	@hugo server --disableFastRender --buildFuture --buildDrafts -bind=0.0.0.0
