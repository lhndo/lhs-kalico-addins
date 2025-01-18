## Switch Klipper


This script automates switching between klipper mainline (default) and Kalico
This switch is done by renaming the klipper folders and the configuration file.  


## Setup

:warning: Backup your klipper configuration first by downloading a copy of ~/printer_data/config/ 


### Requirements

1. **Copy script to home folder:**

```
cd ~/klipper/LHS_Tools/switch_klipper/
chmod +x switch_klipper.sh
ln -s $(pwd)/switch_klipper.sh ~/switch_klipper.sh
cd ~
```

2. **File Structure Setup**



* Currently running Kalico, you should have the following:  

> Folders: **klipper/, klipper_ml/**  
> Files: **printer.cfg, printer.cfg.ml**  


* Currently running klipper mainline (default):  

> Folders: **klipper/, klipper_kalico/**  
> Files: **printer.cfg, printer.cfg.kalico**  

## Usage

To switch to Kalico

```
sudo ./switch_klipper.sh kalico
```

To switch to klipper mainline

```
sudo ./switch_klipper.sh klipper
```
<br>