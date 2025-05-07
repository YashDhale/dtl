#!/bin/bash

# Check if a file was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 patients.csv"
    exit 1
fi

file="$1"

# Initialize counters
total_patients=0
critical_count=0

# Output file
log_file="critical_log.txt"
echo "Critical Cardiology Patients Log - $(date)" > "$log_file"
echo "-----------------------------------------" >> "$log_file"

# Skip the header and read the file line by line
tail -n +2 "$file" | while IFS=',' read -r name age department condition; do
    # Trim whitespace
    name=$(echo "$name" | xargs)
    age=$(echo "$age" | xargs)
    department=$(echo "$department" | xargs)
    condition=$(echo "$condition" | xargs)

    # Increment total patient counter
    ((total_patients++))

    # Check for Cardiology & Critical condition
    if [[ "$department" == "Cardiology" && "$condition" == "Critical" ]]; then
        ((critical_count++))
        message="🚨 Patient: $name | Age: $age | Department: $department | Condition: $condition"
        echo "$message"
        echo "$message" >> "$log_file"
    fi
done

# Final report
echo ""
echo "✅ Total patients processed: $total_patients"
echo "🚨 Total Cardiology-Critical patients: $critical_count"
echo "📄 Detailed log saved in: $log_file"
