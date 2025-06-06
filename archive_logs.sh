#!/bin/becho "Select log type to archive:"

echo "1) heart_rate.log"
echo "2) temperature.log"
echo "3) water_usage.log"
read -p "Enter option [1-3]: " answer

time=$(date +%Y-%m-%d_%H-%M-%S)
if [[ "$answer" == "1" ]]; then
	ARCHIVE="heart_data_archive"
	FILE="heart_rate.log"
elif [[ "$answer" == "2" ]]; then 
	ARCHIVE="temperature_data_archive"
	FILE="temperature.log"
elif [[ "$answer" == "3" ]]; then
	ARCHIVE="water_usage_data_archive"
	FILE="water_usage.log"
else
       	echo "Invalid! Please select 1, 2 or 3"
	exit 1
fi
ACTIVE_PATH=/hospital_data/active_logs/$FILE
ARCHIVE_PATH=/hospital_data/archived_logs/$ARCHIVE

#Does the file exist?
if [[ ! -f $ACTIVE_PATH ]]; then
	echo "log file not found"
	exit 1
fi
#Make sure the archive directory exists and create it if it doesn't exist
mkdir -p $ARCHIVE_PATH

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_FILENAME=${FILE%.log}_$timestamp.log
ARCHIVE_FILE_PATH=$ARCHIVE_PATH/$ARCHIVE_FILENAME

#MOVEING THE FILE AND CREATING AN EMPTY ONE
mv "$ACTIVE_PATH" "$ARCHIVE_FILE_PATH"
touch "ACTIVE_FILE_PATH"

echo "Successfully archived to: $ARCHIVE_FILE_PATH"
