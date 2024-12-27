#!/bin/bash
#
#
# set -x
if [[ -z $MIRROR_DOMAIN ]]; then
    echo "必须要设置 MIRROR_DOMAIN 环境变量"
    exit 1
fi
cd $(dirname $0)
tmpl_dir="../data/tmpl"
for source_file in $(find $tmpl_dir -type f); do
    target_file=$(echo $source_file|sed "s|$tmpl_dir||1")
    target_dir="$(dirname $target_file)"
    if [[ ! -e $target_dir ]]; then
        echo "$target_dir 目录不存在 "
        echo "创建目录 $target_dir"
        mkdir -p $target_dir
    fi
    dockerize -template $source_file:$target_file
done
