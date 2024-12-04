#!/bin/sh

pandoc --css=main.css --embed-resources --standalone --number-sections -o ./dist/readme.html ./readme.md
wkhtmltopdf --default-header toc ./dist/readme.html ./dist/readme.pdf
