#!/bin/sh
# Script: take-screenshot.sh
# Purpose: Take screenshot on display
# Author: Vincent Phan <vincent.phan@firstidea.vn> under GPL v2.x+
# ----------------------------------------------------------------

DEV_ID=$ND_DEVICE_ID
DEV_NAME=$ND_DEVICE_NAME
SCREEN_WIDTH=$ND_SCREEN_WIDTH
SCREEN_HEIGHT=$ND_SCREEN_HEIGHT

LOG_FILE=/usr/src/app/cron.log

# Define a timestamp function
timestamp() {
    date +"%Y-%m-%d_%H-%M-%S"
}

FILE=$DEV_NAME-$DEV_ID-$(timestamp).bmp

echo "Take screenshot of device: \nId:$DEV_ID \nName:$DEV_NAME \nFile:$FILE" | tee -a $LOG_FILE
./raspi2bmp -w $SCREEN_WIDTH -h $SCREEN_HEIGHT -c 0 -o $FILE 

if [ -f $FILE ]; then
    echo "Screenshot name: $FILE" | tee -a $LOG_FILE
    echo "Try to upload to Dropbox" | tee -a $LOG_FILE
    ./dropbox_uploader.sh -p upload $FILE $FILE
else
    echo "Nothing to upload." | tee $LOG_FILE
    exit 1
fi