#!/bin/bash

# Ensure reports directory exists
mkdir -p reports

# Prompt user for log file selection
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Validate user input and assign corresponding log file
case "$choice" in
    1) log_file="hospital_data/active_logs/heart_rate.log" ;;
    2) log_file="hospital_data/active_logs/temperature.log" ;;
    3) log_file="hospital_data/active_logs/water_usage.log" ;;
    *) echo "Invalid choice. Please select 1, 2, or 3."; exit 1 ;;
esac

# Check if log file exists
if [[ ! -f "$log_file" ]]; then
    echo "Error: Log file $log_file not found!"
    exit 1
fi

# Extract device count and timestamps
echo "Analyzing $log_file..."
total_count=$(awk '{print $2}' "$log_file" | sort | uniq -c)
first_entry=$(head -n 1 "$log_file" | awk '{print $1}')
last_entry=$(tail -n 1 "$log_file" | awk '{print $1}')

# Append results to report file
report_file="reports/analysis_report.txt"
{
    echo "Analysis of $log_file"
    echo "---------------------------"
    echo "Total count per device:"
    echo "$total_count"
    echo "Timestamp of first entry: $first_entry"
    echo "Timestamp of last entry: $last_entry"
    echo "---------------------------"
} >> "$report_file"

echo "Analysis complete! Results saved in $report_file."
