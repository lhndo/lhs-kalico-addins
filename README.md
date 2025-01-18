<p align="center">
<a href="https://github.com/lhndo/LH-Stinger/"><img  src="https://github.com/lhndo/LH-Stinger/wiki/Images/LH_Stinger_Logo_512px.png" alt="Danger-Klipper Logo" width=200px></a>
<a href="https://docs.kalico.gg"><img  src="docs/logo/kalico-big.png" width=250px alt="Kalico Logo"></a>
</p>


This branch provides the add-in files for the [Kalico - Bleeding Edge V2](https://github.com/KalicoCrew/kalico/tree/bleeding-edge-v2) branch which includes quality of life additions for the LH Stinger.  



### Installation

1. Make sure you have [kalico](https://github.com/KalicoCrew/kalico) installed, then run the following installation script:

```
cd ~
git clone https://github.com/lhndo/lhs-kalico-addins khs-kalico-addins
ln -s ~/lhs-kalico-addins/LHS_Tools/switch_klipper/switch_klipper.sh ~/switch_klipper.sh
for file in ~/lhs-kalico-addins/LHS_Config/*; do ln -s "$file" ~/printer_data/config/$(basename "$file"); done
for file in ~/lhs-kalico-addins/klippy/plugins/*; do ln -s "$file" ~/klipper/klippy/plugins/$(basename "$file"); done
rm -rf ResHelper && git clone https://github.com/lhndo/ResHelper.git ResHelper
~/ResHelper/install.sh
 ~/klippy-env/bin/pip install -r ~/klipper/scripts/klippy-requirements.txt
sudo systemctl restart klipper
```

2. Port the differences from the provided **printer.cfg.kalico_ref** to your **printer.cfg**

<br>

### Features

- LH Stinger required plugin modules  
- [LH Stinger Kalico Configuration](/LHS_Config) (set up for [MPC heater control](https://github.com/DangerKlippers/danger-klipper/blob/master/docs/MPC.md))
- [Switch Klipper](/LHS_Tools/switch_klipper) (easy switching between Kalico and klipper mainline)



<br>
<br>

<br>
<br>
