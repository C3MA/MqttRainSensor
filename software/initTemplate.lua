-- Tell the chip to connect to thi access point
wifi.setmode(wifi.STATION)
wifi.sta.config("SSID","PASSWORD")

if (file.open("main.lua")) then
    print("Compiling ...")
    node.compile("main.lua")
    file.remove("main.lua")
    node.restart()
else
    -- Use: tmr.stop(6) to abort
    print("Autostart in 5 Seconds. ")
    tmr.alarm(6, 5000, 0, function()
        dofile("main.lc")
    end)
end
