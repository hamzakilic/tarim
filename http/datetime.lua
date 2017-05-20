
return function (connection, req, args)

     local clock = dofile('clock.lc');
     local date = clock:read();
     
     local json= cjson.encode({year=date.year,month=date.month,date=date.date,hour=date.hour,minute=date.minute,second=date.second,day=date.day});
     print(json);
     
     local header =dofile('httpserver-header.lc');
     header(connection,200,'json',nil);
     connection:send(json);
     
     clockfile=nil;
     header=nil;
     collectgarbage()
  end
