#!/bin/bash

# https://stackoverflow.com/questions/11929461/how-can-i-run-dos2unix-on-an-entire-directory
find . -type f -print0 | xargs -0 dos2unix
