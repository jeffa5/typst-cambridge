local-install:
	mkdir -p ~/.local/share/typst/packages/local/
	rm -rf ~/.local/share/typst/packages/local/cambridge-slides-0.1.0
	rm -rf ~/.local/share/typst/packages/local/cambridge-thesis-0.1.0
	cp -r ./slides ~/.local/share/typst/packages/local/cambridge-slides-0.1.0
	cp -r ./thesis ~/.local/share/typst/packages/local/cambridge-thesis-0.1.0
