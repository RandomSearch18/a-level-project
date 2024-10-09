#!/bin/sh

pandoc --css=main.css --embed-resources --standalone -o ./dist/readme.html ./readme.md