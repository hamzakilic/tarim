require('configfile');
watcher = {}
function watcher.init()
    watcher.timer = tmr.create();
    watcher.timer:register(5000,tmr.ALARM_AUTO,
    function()
    watcher.execute();
    end)
end
function watcher.start()
    watcher.timer:start();
end

function watcher.stop()
    watcher.timer:stop();
end

function watcher.execute()
    print(tmr.now())
    configfile.read();
    if configfile.data ~= nil then
        print(configfile.data.update)
    end
    
end