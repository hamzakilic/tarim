
local app={};

function app:start()    

    --ds3231 =dofile('ds3231.lc')
    --ds3231.init(3, 4);
    --ds3231.setTime(0, 28, 17, 6, 20, 5, 17);
    --second, minute, hour, day, date, month, year = ds3231.getTime();

-- Get current time
--print(string.format("Time & Date: %s:%s:%s %s/%s/%s", hour, minute, second, date, month, year))
    --ds3231.setTime(0, 29, 19, 2, 15, 5, 17);
--    second, minute, hour, day, date, month, year = ds3231.getTime();
    --print(string.format("Time & Date: %s:%s:%s %s/%s/%s", hour, minute, second, date, month, year))
    
    motors= dofile('motors.lc');
    motors:init();
    motors= nil;

    clock= dofile('clock.lc');
    clock:read();
    print(string.format("Time & Date: %s:%s:%s %s", clock.hour, clock.minute, clock.second, clock.day))
    clock= nil;
    
    collectgarbage();
    watcher = dofile('watcher.lc');
    watcher:start();    
    webwifi = dofile('webwifi.lc')
    webwifi:start();

end


return app;
