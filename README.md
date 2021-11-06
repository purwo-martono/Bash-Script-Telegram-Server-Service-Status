# Bash script to send active services on server to [Telegram](https://web.telegram.org/)

## Modification of telegram-send from [Konstantin Bogomolov](https://bogomolov.tech/Telegram-notification-on-SSH-login/)
##### Don't forget to create [telegram-send](https://github.com/purwo-martono/telegram-send) file first

##### This bash script will check ufw, ssh, apache2, php, postgresql, and samba services, after that it will send message to telegram whether the status active or not
```
#!/bin/bash

## define it
ipAddress=$(hostname -I)
listService=("ufw" "ssh" "apache2" "php5.6-fpm" "postgresql" "smbd")

## get length of $service array
len=${#listService[@]}

## Use bash for loop
message=$(for (( i=0; i<$len; i++ ));
      do
        status=$( systemctl is-active "${listService[$i]}")
        echo "${listService[$i]} $status";
      done
      )
telegram-send "SERVICE OF YOUR_SERVER $ipAddress"$'\n'"$message"
```
