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
pandoc --css=main.css --embed-resources --standalone -F mermaid-filter --number-sections --metadata-file metadata.yaml -o ./dist/readme.html ./readme.md
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
