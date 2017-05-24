#!/bin/bash

ctags -R --c++-kinds=+p --fields=+iaS --extra=+q `find -type f -name "*.[c|h]" -o -name "*.cpp"`
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
