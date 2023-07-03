#!/usr/bin/env bash

# OUT=$(curl -sw "%{http_code} %{redirect_url} %{http_code}" http://crdss.org)
# echo woot
# echo $OUT
# echo $OUT | awk '{print $2}'
# echo $OUT | cut -d ' ' -f 3
# echo $OUT | sed -n -e 's/^ //p'
# STA=$(echo $OUT | awk '{print $2}')
# LOC=$(echo $OUT | cut -d ' ' -f 3)

# echo $STA
# echo $LOC

# echo -----

OUT=$(curl -vs $1 2>&1 | grep '^<')
if [[ $? -ne 0 ]]; then
  echo curl execution failed
  exit 1
fi

STA=$(echo "$OUT" | grep '^< HTTP' | cut -d ' ' -f 3)
if [[ $STA -ne $2 ]]; then
  echo incorrect status code - expected $2, got $STA
  exit 2
fi

if [[ $STA -ne 301 ]]; then
  exit 0
fi


LOC=$(echo "$OUT" | grep '^< Loca' | cut -d ' ' -f 3 | sed -n -e 's/\r//p')
if [[ $LOC != $3 ]]; then
  echo incorrect location header - expected $3, got $LOC
  exit 3
fi
