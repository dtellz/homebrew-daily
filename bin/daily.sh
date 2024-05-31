#!/bin/bash

# Define the file to store the daily notes
LOG_FILE="$HOME/daily_log.txt"

# Helper function to add a date entry if it's a new day
add_date() {
    tomorrow=$(date -v+1d "+%A %d/%m/%y:") # Calculate tomorrow's date for macOS
    # tomorrow=$(date -d "next day" "+%A %d/%m/%y:") # Use this line instead on Linux
    if ! grep -q "$tomorrow" "$LOG_FILE"; then
        echo "////" >> "$LOG_FILE"
        echo "$tomorrow" >> "$LOG_FILE"
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
    tomorrow=$(date -v+1d "+%A %d/%m/%y:")
    sed -i '' "/$tomorrow/{n;:a;n;/^ *TODO:/b;s/$/\\
         - $1/;ba}" "$LOG_FILE"
}

# Function to handle the 'do' command
daily_do() {
    add_date
    tomorrow=$(date -v+1d "+%A %d/%m/%y:")
    sed -i '' "/$tomorrow/{n;:a;n;/^ *DID:/b;s/$/\\
         - $1/;ba}" "$LOG_FILE"
}

# Function to display today's tasks
daily_display() {
    if [[ $1 == "future" ]]; then
        tomorrow=$(date -v+1d "+%A %d/%m/%y:")
        echo "Displaying entries for tomorrow: $tomorrow"
        awk -v date="$tomorrow" '$0 ~ date, /\/\/\//' "$LOG_FILE"
    else
        today=$(date "+%A %d/%m/%y:")
        echo "Displaying entries for today: $today"
        awk -v date="$today" '$0 ~ date, /\/\/\//' "$LOG_FILE"
    fi
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
        daily_display "$2"
        ;;
    search)
        daily_search "$2"
        ;;
    *)
        echo "Invalid command: $1"
        echo "Usage: daily [did|do|display|search] [args]"
        ;;
esac
