# Submission Reminder App - (Summative for Introduction to Linux)

A shell script-based application that helps track and remind students about upcoming assignment deadlines. This application was created as part of a Linux shell scripting assignment.


# Submission Reminder App

This application reminds students about upcoming assignment deadlines.

## Setup

To set up the environment for the Submission Reminder App, follow these steps:

1. Clone the repository to your local machine.

    ```bash
    git clone https://github.com/kethia19/submission_reminder_app_kethia19.git
    ```

2. Navigate to the repository folder.

    ```bash
    cd submission_reminder_app_kethia19
    ```

3. Run the `create_environment.sh` script:

    ```bash
    ./create_environment.sh
    ```

or

    ```bash
    bash create_environment.sh
    ```

4. You will be prompted to enter your name (e.g., `Kethia`). This will create a directory with the appropriate name: `submission_reminder_Kethia`.

5. The following directory structure will be created:
    - `config/`: Contains configuration files.
    - `modules/`: Contains functional code.
    - `app/`: Contains the reminder logic.
    - `assets/`: Contains sample student submissions and an image.
    - `startup.sh`: Script to start the application.

After running the setup script "create_environment.sh", the following directory structure is created:

```
submission_reminder_[yourname e.g Kethia]/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh            # The script to start the application
```

Then, run the startup.sh to start the application

## Run the Application

To run the application:

1. Navigate to the main directory of the app.
2. Execute the `startup.sh` script:

    ```bash
    ./startup.sh
    ```

This will execute the reminder logic and check student submission deadlines.


## Author

Created by Kethia Kayigire
