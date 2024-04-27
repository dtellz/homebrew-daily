#!/bin/bash

# Define the file to store the daily notes
LOG_FILE="$HOME/daily_log.txt"

# Helper function to add a date entry if it's a new day
add_date() {
    today=$(date "+%A %d/%m/%y:")
    if ! grep -q "$today" "$LOG_FILE"; then
        echo "////" >> "$LOG_FILE"
        echo "$today" >> "$LOG_FILE"
        echo "         DID:" >> "$LOG_FILE"
        echo "         TODO:" >> "$LOG_FILE"
    fi
}

# Check if the log file exists, if not create it
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
    add_date
fi

# Function to handle the 'did' command
daily_did() {
    add_date
    sed -i '' "/TODO:/i \\
    - $1
    " "$LOG_FILE"
}

# Function to handle the 'do' command
daily_do() {
    add_date
    sed -i '' "/TODO:/a \\
    - $1
    " "$LOG_FILE"
}

# Function to display today's tasks
daily_display() {
    today=$(date "+%A >>> %d/%m/%y:")
    # Escape characters that might be interpreted by awk as special regex characters
    escaped_today=$(printf '%s' "$today" | sed 's/[^^]/[&]/g; s/\^//g')
    awk -v today="$escaped_today" '$0 ~ today, /\/\/\//' "$LOG_FILE" | tail -n +2
}


# Function to search by date or keyword
daily_search() {
    if [[ $1 =~ ^[0-9]{2}/[0-9]{2}/[0-9]{2}$ ]]; then
        # Search by date
        grep -A 3 "$1" "$LOG_FILE"
    else
        # Search by keyword
        grep -B 1 -A 1 "$1" "$LOG_FILE" | grep -v '^\-\-' | sed '/^$/d'
    fi
}

# Handle command line arguments
case "$1" in
    did)
        daily_did "$2"
        ;;
    do)
        daily_do "$2"
        ;;
    display)
        daily_display
        ;;
    search)
        daily_search "$2"
        ;;
    *)
        echo "Invalid command: $1"
        echo "Usage: daily [did|do|display|search] [args]"
        ;;
esac
