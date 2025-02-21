#!/bin/bash

# Asking the user to enter their name
echo "Enter your name here:"
read yourName

# Defining the main directory based on the user's input
main_dir="submission_reminder_${yourName}"

# Creating the main directory
mkdir -p "$main_dir"

# Creatign subdirectories for the application
mkdir -p "$main_dir/config"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/assets"

# At this stage, the subdirectories are created. Now for the files

# Creating and adding the script in config.env file
cat <<EOL > "$main_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Creating and adding the script in functions.sh file
cat <<EOL > "$main_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOL

# Creating and adding the script in reminder.sh file
cat <<EOL > "$main_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL

# Creating and adding submissions.txt with student data
cat <<EOL > "$main_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOL

# Creating the startup.sh script to start the application
cat <<EOL > "$main_dir/startup.sh"
#!/bin/bash

# Startup script to run the reminder application
echo "Starting the Submission Reminder App..."

# Run the reminder script
bash ./app/reminder.sh
EOL

# Making startup.sh executable
chmod +x "$main_dir/startup.sh"

# Then lastly, notifying the user that the environment is set up
echo "Environment for Submission Reminder App has been created successfully in $main_dir. Run ./startup.sh inside $main_dir to start the application."

