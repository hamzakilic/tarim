webserver = {}

function webserver.init()

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

local serverFiles = {
   'httpserver.lua',
   'httpserver-b64decode.lua',
   'httpserver-basicauth.lua',
   'httpserver-conf.lua',
   'httpserver-connection.lua',
   'httpserver-error.lua',
   'httpserver-header.lua',
   'httpserver-request.lua',
   'httpserver-static.lua',
}
for i, f in ipairs(serverFiles) do compileAndRemoveIfNeeded(f) end

compileAndRemoveIfNeeded = nil
serverFiles = nil
collectgarbage()


end

function webserver.start()


-- Function for starting the server.
-- If you compiled the mdns module, then it will register the server with that name.

   local serverPort = 80
    server = dofile("httpserver.lc")
    webserver.srv = server(serverPort)
   if webserver.srv then
      print("nodemcu-httpserver running at:")
      print("   http://192.168.1.1:" ..  serverPort)
      
   end


end

function webserver.stop()
    if webserver.srv ~= nil then
        webserver.srv:close();
    end
    
end