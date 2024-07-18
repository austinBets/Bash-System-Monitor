# PC Performance Monitoring Script

This Linux shell script monitors your PC's performance and sends alerts via email when CPU, memory, or disk usage exceeds specified thresholds. The script is designed to run on Ubuntu and uses common Unix utilities to gather system performance data.

## Features

- **CPU Usage Monitoring**: Checks the current CPU usage and triggers an alert if it exceeds the defined threshold.
- **Memory Usage Monitoring**: Monitors the memory usage and sends an alert if it surpasses the set threshold.
- **Disk Usage Monitoring**: Keeps track of the disk usage and issues an alert if it goes beyond the specified limit.
- **Network Usage Monitoring**: Monitors network bandwidth usage and alerts if it exceeds the defined threshold.
- **Email Alerts**: Sends an email notification when any of the resource usage levels exceed their respective thresholds.

## Usage

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your_username/pc-performance-monitor.git
    cd pc-performance-monitor
    ```

2. **Set Up Email Alerts**:
   Replace `your_email@example.com` with your actual email address in the script to receive alerts.

3. **Set Thresholds**:
   You can adjust the usage thresholds for CPU, memory, and disk usage by modifying the `CPU_THRESHOLD`, `MEMORY_THRESHOLD`, and `DISK_THRESHOLD` variables at the top of the script.

4. **Run the Script**:
    ```bash
    chmod +x monitor.sh
    ./monitor.sh
    ```

5. **Schedule the Script to Run at Intervals**:
    To run the script at regular intervals, you can use `cron` jobs. Edit the cron table using:
    ```bash
    crontab -e
    ```
   Add a new line to schedule the script. For example, to run the script every 5 minutes, add:
    ```bash
    */5 * * * * /path/to/monitor.sh
    ```
   Replace `/path/to/monitor.sh` with the actual path to your script. Save and exit the editor to apply the changes.

## Requirements

- Ubuntu (or any Unix-like OS)
- `mail` utility for sending email alerts
- Basic Unix utilities: `top`, `grep`, `sed`, `awk`, `df`, `bc`, `vnstat`
- `cron` for scheduling tasks

## Additional Steps 

1. **Install `vnstat` for network monitoring**
    ```bash
    sudo apt-get install vnstat
    ```

2. **Ensure `mail` is install and configured**
    ```bash
    sudo apt-get install mailutils
    ```




For any questions please contact <austinbetschart2024@outlook.com>
