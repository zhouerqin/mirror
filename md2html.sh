#!/bin/bash
#
pandoc --standalone --self-contained \
    --css mirrors/rootfs/data/tmpl/data/help/pandoc.css \
    mirrors/rootfs/data/tmpl/data/help/help.md \
    --output mirrors/rootfs/data/tmpl/data/help/help.html
