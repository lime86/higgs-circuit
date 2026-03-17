slides:
	npx @marp-team/marp-cli@latest -s ./slides

build/%.pptx: slides/%.md
	npx @marp-team/marp-cli@latest $< -o $@

.PHONY: slides