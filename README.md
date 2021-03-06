# RainSensor
ESP8266 controlled rain sensor monitoring
Based on the nodemcu-firmware

## Interface

1. Switch
2. Wifi
  1. Mqtt
  2. TCP Debugging interface

## Setup
The first (blue) ESP-01 was used as hardware.

The rain sensor must be connected to **GPIO2**.
The input is internal pulled up to **GND**. In order to activate it, the pin must be pulled to **3.3V**.

## Debug Mode
Activate the debug Mode, with your PC (mosqiutto-client required):
```
mosquitto_pub -h 10.23.42.10 -t "/room/rainsensor/debug" -m "enabled"
```
Then the device is accessable via **telnet** via the published IP address on port 2323

## Upgrade
The code must be filled with the correct passwords:
```
cd software/
cat initTemplate.lua | sed "s/SSID/ask for the SSID/" | sed "s/PASSWORD/ask for the password/" > init.lua && sudo programESP.sh serial init.lua init.lua
```
