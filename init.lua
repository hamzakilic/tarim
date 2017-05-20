




-- Compile server code and remove original .lua files.
-- This only happens the first time after server .lua files are uploaded.

local compileAndRemoveIfNeeded = function(f)
   if file.open(f) then
      file.close()
      print('Compiling:', f)
      node.compile(f)
      file.remove(f)
      collectgarbage()
   end
end

local files = {   
 'httpserver.lua',
   'httpserver-b64decode.lua',
   'httpserver-basicauth.lua',
   'httpserver-conf.lua',
   'httpserver-connection.lua',
   'httpserver-error.lua',
   'httpserver-header.lua',
   'httpserver-request.lua',
'httpserver-static.lua',
   'motors.lua',
   'pins.lua',
   'watcher.lua',
   'webserver.lua',
   'configfile.lua',
   'clock.lua',
   'app.lua',
   'ds3231.lua',
   'webwifi.lua'
   
   
}
for i, f in ipairs(files) do compileAndRemoveIfNeeded(f) end

compileAndRemoveIfNeeded = nil
serverFiles = nil
collectgarbage()




    --print("Startup");
    if file.open("app.lc") == nil then
        print("app.lc deleted or renamed")
    else
        --print("Running")
        file.close("app.lc")
        -- the actual application is stored in 'application.lua'
        app=dofile("app.lc");
        app:start();
    end


