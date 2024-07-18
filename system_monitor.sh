#Represent the usage levels that when exceeded, will trigger an alert.
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
NETWORK_THRESHOLD=1000 # in KB/s
EMAIL="your_email@example.com"

#Check CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 -$1}')
if(( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -1) )); then 
    echo "CPU usage is above threshold: $CPU_USAGE%" | MAIL -S "CPU Alert" $EMAIL
fi

#Check Memory Usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2} * 100.0')
if(( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -1 ))); then
    echo "CPU usage is above threshold: $CPU_USAGE%" | MAIL -S "CPU Alert" $EMAIL
fi

#Check Disk Usage
DISK_USAGE=$(df -h / | grep '/' | awk '{print $5}' | sed 's/%//g')
if ((DISK_USAGE > DISK_THRESHOLD)); then 
    echo "Disk usage is above threshold: $DISK_USAGE%" | mail -s "Disk Alert" $EMAIL
fi

#Check Network Usage
NETWORK_USAGE=$(vnstat -tr 2 | grep 'rx' | awk '{print $2}')
if (( $(echo "$NETWORK_USAGE > $NETWORK_THRESHOLD" | bc -1) )); then
    echo "Network usage is above threshold: $NETWORK_USAGE KB/s" | mail -s "NETWORK Alert" $EMAIL
fi
