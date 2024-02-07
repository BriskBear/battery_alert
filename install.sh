#!/usr/bin/bash

# Send an error message and exit the script
function breaker() {
  [[ $# == 2 ]] && code=$2 || code=1
  echo -e "\033[38;5;160m$1\033[0m"
  return "$2" &>/dev/null \; exit "$2"
}

notify=`which dunstify`
notify=${notify:=`which notify-send`}
dependencies=(acpi espeak-ng $notify)

# Error and exit if missing dependencies
for d in ${dependencies[@]}
do
  if [[ ! `which $d 2>/dev/null` ]]
  then
    $notify 'Error' "$d is missing"
    breaker "Missing: $d" 1
  fi
done

# Install the files
sudo cp *.service /etc/systemd/system/
sudo cp *_alert /usr/bin/

# Enable+Start the service
sudo systemctl enable battery_alert
sudo systemctl start battery_alert
