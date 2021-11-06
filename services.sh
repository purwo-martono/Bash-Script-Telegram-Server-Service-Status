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
telegram-send "SERVICE MRANGGEN $ipAddress"$'\n'"$message"
