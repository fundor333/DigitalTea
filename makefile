.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

develop: ## Run the site localy
	hugo server --disableFastRender 

developfuture: ## Run the site localy with all the future article
	hugo server --disableFastRender --buildFuture 

developall: ## Run the site localy with all the article, future or drafts
	hugo server --disableFastRender --buildFuture --buildDrafts

img: ## Resize img
	hugo
	sh webp_converter.sh
	sh avif_converter.sh
cache: ## Clean the cache
	hugo --gc

clean: cache img ## Clean the directory of the project of chache e meta file and other things

.PHONY: run
run: clean  ## Build the site cleaning all
	hugo

.PHONY: new
new: ## Make new object for the blog
	python make-post.py

deploy: clean run ## Ready to deploy
