# Blue User Manual Documentation

.PHONY: help check build html pdf clean all preview

help:
	@echo "Blue User Manual Documentation"
	@echo ""
	@echo "Commands:"
	@echo "  check      - Check if Quarto is installed"
	@echo "  build      - Build HTML and PDF"
	@echo "  html       - Build HTML site only"
	@echo "  pdf        - Build PDF only"
	@echo "  preview    - Preview HTML site in browser"
	@echo "  clean      - Remove build artifacts"
	@echo "  all        - Build HTML and PDF"
	@echo ""

check:
	@quarto --version || (echo "Quarto not found. Install from https://quarto.org" && exit 1)
	@echo "Quarto is installed."

# Build both HTML and PDF
all: build

# Build HTML and PDF
build: clean
	@echo "Building HTML..."
	quarto render --to html
	@echo "Building PDF..."
	quarto render --to pdf --output-dir _build/pdf
	@echo ""
	@echo "Build complete!"
	@echo "  HTML: _build/html/index.html"
	@echo "  PDF:  _build/pdf/Blue-Manual.pdf"

# Build HTML site only
html:
	quarto render --to html
	@echo "HTML built: _build/html/index.html"

# Build PDF only
pdf:
	quarto render --to pdf --output-dir _build/pdf
	@echo "PDF built: _build/pdf/Blue-Manual.pdf"

# Preview in browser
preview:
	open _build/html/index.html

# Clean build artifacts
clean:
	rm -rf _build _book site_libs
	find . -maxdepth 1 -type f -name '*.html' -delete
	find gettingStarted concepts reference tasks developers -type f -name '*.html' -delete
