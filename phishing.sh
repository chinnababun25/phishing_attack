#!/bin/bash

# Input file to analyze
INPUT_FILE="text.txt"

# Output log file
LOG_FILE="phishing_detection_report.txt"

# Clear the log file if it exists
> "$LOG_FILE"

echo "Phishing Detection Report - $(date)" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

# Check for suspicious URLs
echo "Checking for suspicious URLs..." >> "$LOG_FILE"
grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" "$INPUT_FILE" | while read -r url; do
    # Check if the URL contains an IP address
    if [[ "$url" =~ [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        echo "[ALERT] IP-based URL found: $url" >> "$LOG_FILE"
    fi

    # Check if the URL has mismatched domains
    if [[ "$url" =~ (login|verify|account|secure|update) ]]; then
        echo "[ALERT] Suspicious keyword in URL: $url" >> "$LOG_FILE"
    fi
done

# Check for suspicious keywords
echo "Checking for phishing keywords..." >> "$LOG_FILE"
grep -iE "login|verify|password|account|secure|update|click here" "$INPUT_FILE" >> "$LOG_FILE"

# Check for HTML obfuscation
echo "Checking for HTML obfuscation..." >> "$LOG_FILE"
grep -i "<script>" "$INPUT_FILE" >> "$LOG_FILE"
grep -i "base64" "$INPUT_FILE" >> "$LOG_FILE"

# Finalize the report
echo "----------------------------------------" >> "$LOG_FILE"
echo "Phishing detection completed. Results saved to $LOG_FILE."

# Notify user
cat "$LOG_FILE"
