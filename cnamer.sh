#!/bin/sh
if [ -z "$1" ]; then
   echo "Please provide a domain name"
   exit 1
fi
if [ ! -f "$1" ]; then
   echo "$1 is not a valid file"
   exit 1
fi
for domain in $(cat $1); do
   if [ $(dig +short $domain CNAME | wc -l) -eq 0 ]; then
      echo "$domain does not have a CNAME record"
   else
      echo "$domain has a CNAME record"
   fi
done
