Hospital Data Monitoring & Archival System
Overview
This project is designed to automate log management for hospital patient health metrics and resource usage. It uses interactive shell scripts and Linux command-line tools to handle real-time data collection, structured archival, and intelligent analysis.

Features & Functionality
1. Real-Time Data Collection
Python simulators (heart_monitor.py, temp_sensor.py, water_meter.py) generate live log files capturing:

Heart rate readings from multiple monitors.

Temperature sensor records.

Water consumption tracking.

2. Interactive Log Archival (archive_logs.sh)
Prompts the user to select a log file for archival (heart rate, temperature, or water usage).

Moves the selected log to its respective archive folder.

Renames it using a timestamp for easy reference.

Creates a new empty log file for continued monitoring.

Includes error handling for invalid input and missing files.

Example Usage
bash
./archive_logs.sh
Select log to archive:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3): 1
Archiving heart_rate.log...
Successfully archived to heart_data_archive/heart_rate_2025-06-06_21:45:10.log
3. Intelligent Log Analysis (analyze_logs.sh)
Offers menu-based selection of logs to analyze.

Extracts key statistics (total device occurrences, first and last timestamps).

Saves insights to reports/analysis_report.txt for review.

Example Usage
bash
./analyze_logs.sh
Select log file to analyze:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3): 2
Analyzing temperature.log...
Sensor A - 320 readings
Sensor B - 290 readings
Analysis saved to reports/analysis_report.txt
Technologies Used
Shell Scripting (select, case, mv, touch, awk, grep, sort)

Log Archival & Processing (date, echo, uniq, head, tail)

Python for Simulations (Generating real-time hospital data)

Repository Submission Guidelines
GitHub Repository: Coding-lab_Group{nbr}

Must include:

archive_logs.sh

analyze_logs.sh

README.md

Python simulation scripts

Learning Objectives
Shell Scripting Proficiency: Interactive menus, error handling, file management.

Log Management & Automation: Timestamped archival, structured organization.

Data Analysis with CLI Tools: Extracting device statistics, report generation.

This system simplifies hospital data monitoring while ensuring efficient archival and analysis.
