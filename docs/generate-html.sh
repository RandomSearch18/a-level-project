#!/bin/sh

mkdir -p ./dist
pandoc --css=main.css --embed-resources --standalone --number-sections -o ./dist/readme.html ./readme.md
wkhtmltopdf --default-header --disable-smart-shrinking toc ./dist/readme.html ./dist/readme.pdf
#wkhtmltopdf --header-right='[page]/[toPage]' toc dist/readme.html dist/readme.pdf
