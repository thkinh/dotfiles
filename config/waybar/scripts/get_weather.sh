#!/usr/bin/env bash

for i in {1..5}; do
  # Get text + status code
  response=$(curl -s -w "\n%{http_code}" "https://wttr.in/$1?format=1")
  status=$(echo "$response" | tail -n1)
  text=$(echo "$response" | sed '$d')

  if [[ "$status" != "200" ]]; then
    echo "{\"code\": $status}"
    exit
  fi

  text=$(echo "$text" | sed -E "s/\s+/ /g")

  # Get tooltip + status code
  response=$(curl -s -w "\n%{http_code}" "https://wttr.in/$1?format=4")
  status=$(echo "$response" | tail -n1)
  tooltip=$(echo "$response" | sed '$d')

  if [[ "$status" != "200" ]]; then
    echo "{\"code\": $status}"
    exit
  fi

  tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")

  echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
  exit

  sleep 2
done

echo "{\"code\": 500}"
