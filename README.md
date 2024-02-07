# Battery Alert Service  
_A systemd service that gives an audible warning when battery-state falls below 15%_  

---  

__Dependencies:__  
  - sudo privileges!
  - acpi _# reads current battery levels_  
  - dunstify __or__ notify-send _# sends battery info to system notifications_  
  - espeak-ng _# reads battery percentage out-loud_  

## Installation:  
1. Download this repository:  
    - `git clone https://github.com/briskbear/battery_alert /tmp/battery_alert`   
2. Enter the repository:  
    - `cd /tmp/battery_alert`  
3. Run the installer:  
    - `./install.sh`  
