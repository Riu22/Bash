#!/bin/bash

TOKEN="5991621461:AAF3IWVeDtKU7m574zt53HfP6GqTQbBt9aw"
ID="5791354086"
MENSAJE="${1}"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"