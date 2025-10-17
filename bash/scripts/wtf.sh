#!/bin/bash

# Check if a word is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <word>"
  exit 1
fi

WORD="$1"
SRC_LANG="en"
TARGET_LANG="vi"

# Fetch translation from Google Translate unofficial API
RESPONSE=$(curl -s "https://translate.googleapis.com/translate_a/single?client=gtx&sl=$SRC_LANG&tl=$TARGET_LANG&dt=t&dt=bd&q=$WORD")

# Parse data
TRANSLATED=$(echo "$RESPONSE" | jq -r '.[0][0][0]')
ORIGINAL=$(echo "$RESPONSE" | jq -r '.[0][0][1]')
PHONETIC=$(echo "$RESPONSE" | jq -r '.[0][0][2] // "Not available"')

# Attempt to get synonyms (usually in .[1][0][1] but often missing)
RAW_SYNONYMS=$(echo "$RESPONSE" | jq -r '.[1][0][1][]' 2>/dev/null)

if [ -z "$RAW_SYNONYMS" ]; then
  SYNONYMS="Not available"
else
  SYNONYMS=$(echo "$RAW_SYNONYMS" | sed 's/^/ - /')
fi

# Display the output
echo "Translated: $TRANSLATED"
echo "Synonyms:"
echo "$SYNONYMS"
echo "Phonetics:  $PHONETIC"
