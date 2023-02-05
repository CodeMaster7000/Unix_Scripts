#!/usr/bin/env bash
nmap -sn $1 -oG - | awk '$4=="Status:" && $5=="Up" {print $2, $3}'
