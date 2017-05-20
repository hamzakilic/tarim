local webserver = {}


function webserver:start()

   
    
    webserver.doserver = dofile("httpserver.lc")   
    webserver.srv = webserver.doserver(80);
   if webserver.srv then
      print("nodemcu-httpserver running at:")
      print("   http://192.168.1.1:80")
      
   end


end

function webserver:stop()
    if webserver.srv ~= nil then
        webserver.srv:close();
        webserver.srv = nil;
        webserver.doserver=nil;    
    
        collectgarbage()
    end
    
end
return webserver;

