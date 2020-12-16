#!/usr/bin/env bash
source $HOME/.bashrc

  # xmlstarlet fo -H -R 2> /dev/null |
  # tidy -iq -xml \
echo "parse: $1"
# cat $1 |
  # sed '/<!--.*-->/d' | sed '/<!--/,/-->/d' |
  # xmlstarlet ed -d '//script' |
  # xmlstarlet ed -d '//style' |
  # xmlstarlet ed -d '//link' |
  # xmlstarlet ed -d '//center' |
  # xmlstarlet ed -d '//header' |
  # xmlstarlet ed -d '//footer' |
  # xmlstarlet ed -d '//aside' |
  # xmlstarlet ed -d '//form' |
  # xmlstarlet ed -d '//@style' |
  # xmlstarlet ed -d '//@itemscope' |
  # xmlstarlet ed -d '//@itemtype' |
  # xmlstarlet ed -d '//@itemprop' |
  # xmlstarlet ed -d '//meta[@charset]' |
  # xmlstarlet ed -d "//meta[@name='tec*']" |
  # xmlstarlet ed -d "//meta[@name='robots']" |
  # xmlstarlet ed -d "//meta[@name='viewport']" |
  # xmlstarlet ed -d '//nav' \
  # > html/$1

printf -v num "%02d" $( echo $1 | sed -n 's/text\(.*\)\..*/\1/p' )
title=$(cat $1 | sed -n '/title/p' | xmlstarlet sel -t -v "//title" ) 
echo "title: $title" 
dir="$num.$(slugify "$title")"
echo "dir: $dir" 
mkdir -p "$dir"
article="$dir/article.md"

echo "---" >> $article
echo "title: $title" >> $article
echo "---" >> $article
echo  >> $article
echo "===" >> $article
echo  >> $article
cat $1 | pandoc -f html -t markdown_phpextra >> $article
