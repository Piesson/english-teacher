#!/bin/bash

# Check if mistakes.md was updated recently
# If not, remind the user

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MISTAKES_FILE="$SCRIPT_DIR/../../mistakes.md"

if [ ! -f "$MISTAKES_FILE" ]; then
    exit 0
fi

# Get file modification time (macOS compatible)
MODIFIED=$(stat -f %m "$MISTAKES_FILE" 2>/dev/null)
NOW=$(date +%s)
DIFF=$((NOW - MODIFIED))

# If mistakes.md wasn't modified in the last 60 seconds, show reminder
if [ $DIFF -gt 60 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📝 mistakes.md 업데이트 확인해주세요!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fi
