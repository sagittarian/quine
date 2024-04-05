#!/bin/bash

function checkquine {
    source=$1
    case $source in
        *.py)
            cmd="python3 $source"
        ;;
        *.js)
            cmd="node $source"
        ;;
        *.hs)
            out="${source%*.hs}"
            ghc -o $out $source 2>&1 > /dev/null
            if [[ $? != 0 ]]; then
                echo Error compiling $source >&2
                return
            fi
            cmd="${source%*.hs}"
        ;;
        *.rb)
            cmd="ruby $source"
        ;;
        *.rs)
            out="${source%*.rs}"
            rustc -o $out $source 2>&1 > /dev/null
            if [[ $? != 0 ]]; then
                echo Error compiling $source >&2
                return
            fi
            cmd="$out"
        ;;
        *)
            return
        ;;
    esac
    echo '->' $source
    diff -asu $source <($cmd)
}

find -name 'quine*' -type f | while read source; do
    checkquine $source
done
