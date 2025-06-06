#!/bin/bash

import time, sys, os
from datetime import datetime
import random

# Ensure the directory exists
os.makedirs('hospital_data/active_logs/', exist_ok=True)

# Only run the script if "start" is provided
if len(sys.argv) > 1 and sys.argv[1] == "start":
    while True:
        now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        bpm1 = random.randint(60, 100)
        bpm2 = random.randint(60, 100)
        with open('hospital_data/active_logs/heart_rate.log', 'a') as f:
            f.write(f"{now} Monitor-1: {bpm1} bpm\n")
            f.write(f"{now} Monitor-2: {bpm2} bpm\n")
        time.sleep(1)