# Instructions for publishing the project document

## Requirements

- `pandoc`
- `wkhtmltopdf`

### To render Mermaid diagrams

```bash
# Install https://github.com/raghur/mermaid-filter
sudo npm install --global mermaid-filter
# Set up Puppeteer, which doesn't seem to happen automatically for some reason
node /usr/lib/node_modules/mermaid-filter/node_modules/puppeteer/install.js
```

## Converting the markdown to HTML

Ensure you're in the `docs` directory.

```bash
mkdir -p ./dist
pandoc --css=main.css --embed-resources --standalone -F mermaid-filter --number-sections -o ./dist/readme.html ./readme.md
```

- `--standalone` ensures that a complete HTML document is generated, not just a fragment.
- `-F mermaid-filter` enables the use of `mermaid-filter` for rendering diagrams.
- Everything else is self-explanatory, hopefully

## Converting the HTML to a PDF

```bash
wkhtmltopdf --default-header --disable-smart-shrinking toc ./dist/readme.html ./dist/readme.pdf
```

- Without `--disable-smart-shrinking`, the font size is inexplicably really small
- `toc ./dist/readme.html` means "include a table of contents, and then include `./dist/readme.html`"
- Everything else should be self-explanatory
