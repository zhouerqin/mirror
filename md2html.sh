#!/bin/bash
#
pandoc --standalone --self-contained \
    --css mirror/rootfs/data/tmpl/data/help/pandoc.css \
    mirror/rootfs/data/tmpl/data/help/help.md \
    --output mirror/rootfs/data/tmpl/data/help/help.html
