-- Tell the chip to connect to thi access point
wifi.setmode(wifi.STATION)
wifi.sta.config("SSID","PASSWORD")
-- All global Variables
sollich=1
maintenanceMode=0

dofile("main.lua")
