
return function (connection, req, args)
     local header =dofile('httpserver-header.lc');
     print('data is coming');     
     local jsonObject= req.getRequestData(req);
     print('json:' .. jsonObject.update)
     --jsonObject = {};
     --jsonObject.update = 'a';
     if jsonObject ~= nil then
        src = file.open('http/config.json','w+')
        if  src then            
            src:write(cjson.encode(jsonObject))
            src:flush()            
            src:close()
            
            dst= file.open('http/config.follow','w+')
            
            dst:close()
            
        end
     end
     header(connection,200,nil,nil);
  end
