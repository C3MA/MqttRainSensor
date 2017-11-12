-- Tell the chip to connect to thi access point
wifi.setmode(wifi.STATION)
wifi.sta.setip({ip="10.23.42.23",netmask="255.255.254.0",gateway="10.23.42.1"})
wifi.sta.config("SSID","PASSWORD")
-- All global Variables
sollich=1
maintenanceMode=0

dofile("main.lua")
