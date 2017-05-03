require('pins')
require("webserver")
webwifi={}
webwifi.gpioOut = D1
webwifi.gpioIn = D2
webwifi.lastState = 0;
webwifi.lastStartedTime = 0
lastRead = 0
cfg={}
    cfg.ssid="cilek"
    cfg.pwd="cilek123"
    cfg.auth=wifi.OPEN
    wifi.ap.config(cfg)
    cfg =
    {
    ip="192.168.1.1",
    netmask="255.255.255.0",
    gateway="192.168.1.1"
    }
function webwifi.start()
   gpio.mode(webwifi.gpioIn,gpio.INPUT);
   print("webwifi mode ok")
tmr.alarm(0,100,1,function()
       readVal = gpio.read(webwifi.gpioIn)        
       if lastRead ~= readVal then
            lastRead = readVal                  
            if readVal == 1 then
               if webwifi.lastState == 1 then                
                     wifiStop()
               else            
                     wifiStart()
                end
            end            
      end
      
    end)
end

function wifiStart()
    print("starting wifi")
    webwifi.lastState = 1  
    
    
    wifi.ap.setip(cfg)
    wifi.setmode(wifi.SOFTAP)
    tmr.delay(500)
    print(wifi.ap.getip())
    
    webwifi.lastStartedTime = tmr.now()
    webserver.start()
    gpio.mode(webwifi.gpioOut,gpio.OUTPUT)
    gpio.write(webwifi.gpioOut,1)
end

function wifiStop()
    print("stoping wifi")
    webwifi.lastState = 0
    webserver.stop()
    wifi.setmode(wifi.NULLMODE) 
    
    tmr.delay(1000)
    
    gpio.mode(webwifi.gpioOut,gpio.OUTPUT)
    gpio.write(webwifi.gpioOut,0)
end





