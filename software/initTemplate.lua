-- Tell the chip to connect to thi access point
wifi.setmode(wifi.STATION)
wifi.sta.config("SSID","PASSWORD")
-- All global Variables
sollich=1
maintenanceMode=0
-- Use: tmr.stop(6) to abort
print("Autostart in 5 Seconds. ")
tmr.alarm(6, 5000, 1, function()
    dofile("main.lua")
end)