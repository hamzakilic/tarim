


local webwifi={}

webwifi.lastState = 0;
webwifi.lastStartedTime = 0


function webwifi:start()
   lastRead = 0
   webwifi.gpioOut = D1
   webwifi.gpioIn = D2
   gpio.mode(webwifi.gpioIn,gpio.INT);
   gpio.mode(webwifi.gpioOut,gpio.OUTPUT);
   gpio.write(webwifi.gpioOut,0);
   print("webwifi mode ok")


local function wifiStart()
    print("starting wifi")
    webwifi.lastState = 1  
    local cfg={}
    cfg.ssid="cilek"
    cfg.pwd="cilek123"
    cfg.auth=wifi.OPEN
    wifi.ap.config(cfg)
    local cfg =
    {
    ip="192.168.1.1",
    netmask="255.255.255.0",
    gateway="192.168.1.1"
    }
    
    wifi.ap.setip(cfg)
    wifi.setmode(wifi.SOFTAP)
    gpio.write(webwifi.gpioOut,1)
    tmr.delay(1000)
    print(wifi.ap.getip())
    
    webwifi.lastStartedTime = tmr.now()
    webwifi.webserver = dofile('webserver.lc');
    webwifi.webserver:start();
    gpio.write(webwifi.gpioOut,1)
    
end

local function wifiStop()
    print("stoping wifi")
    webwifi.lastState = 0
    if webwifi.webserver ~= nil then
       webwifi.webserver:stop();
       webwifi.webserver =nil;
       collectgarbage();
    end
    --webserver.stop()
    wifi.setmode(wifi.NULLMODE) 
    
    tmr.delay(100)
    
    
    gpio.write(webwifi.gpioOut,0)
end
   
    pulse1=0;
    local function up(level,pulse2) 
        --print( level, pulse2 - pulse1 )      
         readVal = gpio.read(webwifi.gpioOut)        
       
           print(readVal);           
                            
            if readVal == 1 then                              
                     wifiStop()
               else            
                     wifiStart()
            end
         
    end
    
   
   
   gpio.trig(webwifi.gpioIn,"high",up);

 

 
    
end





return webwifi;





