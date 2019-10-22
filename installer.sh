#!/bin/bash
# Script: install.sh
# Purpose: Setup this repo for lazy developer like me ;).
# Author: Vincent Phan <vincent.phan@firstidea.vn> under GPL v2.x+
# -------------------------------------------------------

DIR=nd-tools
# Clone this repo
git clone https://github.com/neural-display/tools.git $DIR

echo "Clone successful"

cd $DIR
echo "Download required apps"
# Download prerequisite
dropbox_file=dropbox_uploader.sh
curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o $dropbox_file
chmod +x $dropbox_file
# Update config file location
sed -i 's/CONFIG_FILE=.*/CONFIG_FILE=.dropbox_uploader/' $dropbox_file

screenshot_file=raspi2bmp
curl "https://raw.githubusercontent.com/ThinhPhan/raspi2bmp/master/raspi2bmp" -o $screenshot_file
chmod +x $screenshot_file

# Create files if needed

echo "Done voilà ;]" 