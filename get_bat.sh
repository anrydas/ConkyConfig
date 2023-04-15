#!/bin/bash

# Parameters:
# 1 - BAT number;
bn=$1
if [ -n $bn ]; then bn=1; fi;
s=`cat /sys/class/power_supply/BAT${bn}/status`
if [ $s == 'Full' ]; then
  r='${color medium spring green}Full'
else
  if [ $s == 'Charging' ]; then
    r='${color yellow}Ch'
  else
    r='${color orange1}Dis'
  fi
fi
c=`cat /sys/class/power_supply/BAT1/capacity`
echo "${r} ${c}%"