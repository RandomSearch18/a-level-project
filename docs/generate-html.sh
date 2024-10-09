#!/bin/sh

pandoc --css=main.css --embed-resources --standalone --number-sections -o ./dist/readme.html ./readme.md
