# Blue Manual 

This repository contains the Blue Manual for the Blue music composition environment.

## Building with Quarto

[Quarto](https://quarto.org/) is the publishing system used to build this manual. It can generate:
- Beautiful HTML websites with navigation and search
- Professional PDF documents via LaTeX
- And many other formats (Word, ePub, etc.)

## Quick Start

### Requirements

1. **Quarto** - Install from https://quarto.org/docs/get-started/
   
   **macOS options:**
   ```bash
   # Option 1: Homebrew (requires sudo password)
   brew install quarto
   
   # Option 2: Download installer directly (no sudo needed)
   # Visit https://quarto.org/docs/get-started/ and download the macOS installer
   
   # Option 3: Download and move to Applications
   curl -L https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.36/quarto-1.9.36-macos.zip \
     -o /tmp/quarto.zip && unzip /tmp/quarto.zip -d /Applications/
   ```

2. **For PDF output**: LaTeX installation
   ```bash
   # macOS (using Homebrew, requires sudo)
   brew install --cask mactex-no-gui
   
   # Or download MacTeX from https://tug.org/mactex/
   ```

### Build Commands

```bash
# Check if Quarto is installed
make check

# Build HTML site
make html
# Output: _build/html/index.html

# Build PDF
make pdf
# Output: _build/pdf/Blue-Manual.pdf

# Build both
make all

# Preview in browser
make preview

# Clean build artifacts
make clean
```

## Output

- **HTML Site:** `_build/html/` folder (open `index.html` in browser)
- **PDF:** `_build/pdf/Blue-Manual.pdf` (2.3MB, book-quality typesetting)

## Features

- **Hierarchical Navigation** - Multi-level sidebar matching original MkDocs structure
- **Search** - Built-in client-side search
- **Dark/Light Themes** - Auto-switching with Cosmo/Darkly themes
- **Cross-references** - Internal linking between sections
- **Print-optimized PDF** - Professional book formatting via LaTeX
- **Code Syntax Highlighting** - With copy buttons
- **Responsive Design** - Works on desktop and mobile

## Structure

```
.
├── _quarto.yml          # Main configuration
├── index.qmd            # Home page
├── preface.qmd          # Preface
├── gettingStarted/      # Getting started section
├── concepts/            # Concepts section
├── reference/           # Reference sections
├── tasks/               # Task guides
├── developers/          # Developer docs
├── images/              # Images
├── Makefile             # Build commands
└── README.md            # Build and usage notes
```

## Configuration

Edit `_quarto.yml` to:
- Change title, author, copyright
- Modify sidebar structure
- Adjust HTML theme
- Configure PDF output

## Differences from MkDocs

| Feature | MkDocs | Quarto |
|---------|--------|--------|
| HTML Output | ✅ Good | ✅ Excellent |
| PDF Output | ⚠️ Limited | ✅ Professional (LaTeX) |
| Search | ✅ Yes | ✅ Yes |
| Themes | Material | Bootstrap (many options) |
| Build Speed | Fast | Fast |

## Troubleshooting

### PDF build fails
Make sure LaTeX is installed:
```bash
# Check LaTeX installation
pdflatex --version

# Install on macOS
brew install --cask mactex-no-gui
```

### Images not showing
Images should be referenced as `/images/filename.png` (absolute path from project root).

### Quarto not found
Install Quarto from https://quarto.org/docs/get-started/ or via package manager.
