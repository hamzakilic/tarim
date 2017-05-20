require('configfile');

local watcher = {}
function watcher:start()
    watcher.timer = tmr.create();
    watcher.timer:register(10000,tmr.ALARM_AUTO,
    function()
    watcher:execute();
    end);
    watcher.timer:start();
end



function watcher:execute()
        --print('watcher executing');
        configfile=dofile('configfile.lc')
        clock =dofile('clock.lc');
        motors =dofile('motors.lc');

    
    configfile:read();
    if configfile.data ~= nil then
        clockval = clock:read();
        print(clockval.day,clockval.hour,clockval.minute)
        --print_r(configfile.data);
       local motor1mustwork = false;
        local motor2mustwork = false;
        for i,v in pairs(configfile.data) do
            local current =configfile.data[i];
            local currentTime =(clockval.day *24*60)+clockval.hour*60+clockval.minute;
            local startTime =(current.d *24*60)+current.sH*60 + current.sM;               
            local endTime = (current.d *24*60)+current.eH*60 + current.eM;
            --print(currentTime,startTime,endTime)
            if (currentTime >= startTime and currentTime< endTime) then
             if current.m1 > 0 then
             print("motor1mustwork");
             motor1mustwork = true;
             end
             if current.m2 > 0 then
             print("motor2mustwork")
             motor2mustwork = true;
             end
            end
            
        end
        motors:work(1,motor1mustwork);
        motors:work(2,motor2mustwork);
    end

    configfile=nil;
    clock = nil;
    motors = nil;
    collectgarbage();
    
end
return watcher;


