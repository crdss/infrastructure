#!/usr/bin/env bash

echo "$@" > ansible-args.txt

OUT=$(ansible-playbook $@ 2>&1)

echo "$OUT" > ansible-out.txt

echo "$OUT"

