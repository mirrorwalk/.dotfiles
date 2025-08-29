#!/bin/sh

while true; do
    win=$(niri msg -j focused-window)
    max_length=30
    title=$(echo "$win" | jq -r '.title')
    app_id=$(echo "$win" | jq -r '.app_id')

    if [ ${#title} -gt $max_length ]; then
        short_title="${title:0:max_length}..."
    else
        short_title="$title"
    fi

    echo "{\"text\":\"$short_title\", \"tooltip\":\"$app_id\"}"
    sleep 0.5
done
