#!/bin/bash

uptime_seconds=$(awk '{print $1}' /proc/uptime)

uptime_hours_minutes=$(date -u -d @${uptime_seconds} +"%H:%M")

uptime_detailed=$(date -u -d @${uptime_seconds} +"%H hours, %M minutes, %S seconds")

echo "{\"text\": \"$uptime_hours_minutes\", \"tooltip\": \"Uptime: $uptime_detailed\"}"
