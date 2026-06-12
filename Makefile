MARP ?= npx --yes @marp-team/marp-cli@latest
SITE_DIR ?= _site

slides:
	$(MARP) -s ./slides

pages: $(SITE_DIR)/index.html

$(SITE_DIR)/index.html: slides/higgs.md
	mkdir -p $(SITE_DIR)/img
	$(MARP) --allow-local-files $< -o $@
	cp -R slides/img/. $(SITE_DIR)/img/

build/%.pptx: slides/%.md
	mkdir -p $(@D)
	$(MARP) --allow-local-files $< -o $@

.PHONY: slides pages
