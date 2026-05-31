#!/bin/bash

# --- CONFIGURATION ---
SENDER_NAME="RicoBuyersAgent"
SENDER_EMAIL="ricobuyersagent.au@gmail.com"
# ---------------------

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 \"<Subject>\" <path_to_template> <recipient_email_address>"
    exit 1
fi

SUBJECT=$1
TEMPLATE_FILE=$2
RECIPIENT_EMAIL=$3
MSMTP_CONFIG="$(dirname "$0")/msmtprc"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found at '$TEMPLATE_FILE'"
    exit 1
fi

echo "Sending email to: $RECIPIENT_EMAIL"

# Create email with headers and send
(
    echo "From: \"$SENDER_NAME\" <$SENDER_EMAIL>"
    echo "To: $RECIPIENT_EMAIL"
    echo "Subject: $SUBJECT"
    echo "MIME-Version: 1.0"
    echo "Content-Type: text/html; charset=utf-8"
    echo ""
    cat "$TEMPLATE_FILE"
) | msmtp --file="$MSMTP_CONFIG" "$RECIPIENT_EMAIL"

echo "Email sent successfully to $RECIPIENT_EMAIL."

