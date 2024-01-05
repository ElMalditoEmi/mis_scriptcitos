#!/bin/bash

print_help () {
    echo "Wrong usage! should be something like:
        'sh emiemap.sh [finding/] [target] {FLAGS}'"
    echo "FLAGS:
            -
            -t: top ports only
            "

}

if [ $# -eq 0 ]
then
    print_help
fi