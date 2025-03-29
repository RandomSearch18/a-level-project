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

`mermaid-filter` seems to add quite a bit of time to the build process, unfortunately, but it seems to be the best way to include Mermaid diagrams in the output.

## Converting the markdown to HTML

Ensure you're in the `docs` directory.

```bash
mkdir -p ./dist
pandoc --css=main.css --css=water.css --embed-resources --standalone -F mermaid-filter --number-sections --number-offset 1 --metadata-file metadata.yaml -o ./dist/readme.html ./readme.md
```

- `--css=water.css` includes the [Water.css](https://watercss.kognise.dev/) stylesheet, which just makes the document look nice
- `--css=main.css` is for our own custom styles (of which there aren't many)
- `--standalone` ensures that a complete HTML document is generated, not just a fragment.
- `-F mermaid-filter` enables the use of `mermaid-filter` for rendering diagrams.
- `--number-offset 1` forces heading numbering to start at 1. This is needed because we hide the markdown TOC for printing, but Pandoc wants to assign the hidden Contents section number 1. With this option, the first visible section (Analysis) is numbered 1.
- Everything else is self-explanatory, hopefully

## Converting the HTML to a PDF

```bash
wkhtmltopdf --default-header --disable-smart-shrinking --print-media-type toc ./dist/readme.html ./dist/readme.pdf
```

- Without `--disable-smart-shrinking`, the font size is inexplicably really small
- `toc ./dist/readme.html` means "include a table of contents, and then include `./dist/readme.html`"
- Everything else should be self-explanatory

## Troubleshooting

### Failed to load about:blank

If you get these error messages from `wkhtmltopdf`:

```none
Warning: Blocked access to file
Error: Failed to load about:blank, with network status code 301 and http status code 0 - Protocol "about" is unknown
Exit with code 1 due to network error: ProtocolUnknownError
```

It probably means that one of your `<img>` elements has a `src=` path that doesn't exist on the filesystem.

As far as I can tell, there's no way to tell which image is causing this issue, so maybe do a bisect or something.

### Custom headers and footers

We may need to downgrade our version of `wkhtmltopdf` to 0.12.5 for customising headers and footers to work. See <https://www.odoo.com/forum/help-1/header-and-footer-not-showing-in-pdf-205290>
