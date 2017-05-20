
return function (connection, req, args)

     print('data is coming');     
     local jsonObject= req.getRequestData(req);
     
     --jsonObject = {};
     --jsonObject.update = 'a';
     if jsonObject ~= nil then
        src = file.open('http/config.json','w+')
        if  src then
            print('saving data')            
            src:write(jsonObject)
            src:flush()            
            src:close()
            print('saved data')
            dst= file.open('http/config.follow','w+')
            
            dst:close()
            print('follow saved')
            
        end
     end
     jsonObject = nil;
     local header =dofile('httpserver-header.lc');
     header(connection,200,nil,nil);
         
     
     print("continue is ok")
     header=nil;
     collectgarbage()
  end
