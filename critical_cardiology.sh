#!/bin/bash

# Check if a file was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 patients.csv"
    exit 1
fi

file="$1"

# Read the file line by line
while IFS=',' read -r name age department condition; do
    # Trim whitespace
    name=$(echo "$name" | xargs)
    age=$(echo "$age" | xargs)
    department=$(echo "$department" | xargs)
    condition=$(echo "$condition" | xargs)

    # Check for Cardiology & Critical condition
    if [[ "$department" == "Cardiology" && "$condition" == "Critical" ]]; then
        echo "🚨 Patient: $name | Age: $age | Department: $department | Condition: $condition"
    fi
done < "$file"

echo ""
echo "✅ Total patients processed: $total_patients"
echo "🚨 Total Cardiology-Critical patients: $critical_count"
echo "📄 Detailed log saved in: $log_file"

