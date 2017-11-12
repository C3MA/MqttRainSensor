-- The Mqtt logic
m = mqtt.Client("ESP8266_RainSensor", 120, "user", "pass")

global_c=nil
global_s=nil
function startTelnetServer()
    if (global_s == nil) then
        print("Maintenance Mode starting...")
        global_s=net.createServer(net.TCP, 180)
        global_s:listen(2323,function(c)
        global_c=c
        function s_output(str)
          if(global_c~=nil)
             then global_c:send(str)
          end
        end
        node.output(s_output, 0)
        c:on("receive",function(c,l)
          node.input(l)
        end)
        c:on("disconnection",function(c)
          node.output(nil)
          global_c=nil
        end)
        print("Welcome to the Rainsensor")
        end)
    else
        print ("Telnet server already started")
    end
end


function restartnode()
 if maintenanceMode==1 then
    startTelnetServer()
 else
     print("Rebooting")
     node.restart()
 end
end

function mqttsubscribe()
 tmr.alarm(1,50,0,function() 
        m:subscribe("/room/rainsensor/#",0, function(conn) 
            print("subscribe /room/rainsensor success") 
            m:publish("/room/rainsensor/"  .. "ip",wifi.sta.getip(),0,0)
        end) 
    end)
 -- Used GPIO2 for the sensor
 gpio.mode(4, gpio.INPUT)
 gpio.write(4, gpio.HIGH) -- internal pullup
 -- Send the status of the rainsensor each 30 seconds
 tmr.alarm(3,30000, 1, function()
        -- Read GPIO2
        if ( gpio.read(4) == gpio.LOW) then
            rainState="raining"
        else
            rainState="dry"
        end
        m:publish("/room/rainsensor/"  .. "state",rainState,0,0)
    end)
    
end
m:on("connect", mqttsubscribe)
m:on("offline", function(con) 
    print ("offline")
    restartnode()
end)
m:on("message", function(conn, topic, data)
   if topic=="/room/rainsensor/debug" then
     if data=="enabled" then
        maintenanceMode=1
        startTelnetServer()
     end
   end
end)

-- Wait to be connect to the WiFi access point. 
tmr.alarm(0, 100, 1, function()
  if wifi.sta.status() ~= 5 then
     print("Connecting to AP...")
    -- sleep, if no wifi after 30seconds runtime
    if tmr.now() > 30000000 then
      tmr.stop(0)
      restartnode()
     end
  else
     tmr.stop(0)
     print('IP: ',wifi.sta.getip())
     m:connect("10.23.42.10",1883,0)
  end
end)
