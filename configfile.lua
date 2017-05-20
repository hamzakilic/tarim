
local configfile = {};
configfile.data = nil;

function configfile:read() 
       
    local name="http/config.json";
    local follow="http/config.follow";
    if file.exists(follow) or configfile.data == nil then
        if file.exists(name)  then
                    
            if  file.open(name,'r') then
                print('reading file');
                            
                local data = file.read(1024*6);
                -- print(data)
                ok,configfile.data = pcall(cjson.decode,data);
                --configfile.data = cjson.decode(file.read());
                if ok then                
                 print('json decoded')
                 file.close(name)
                 file.remove(follow);
                else
                 print('json bozuk')
                 file.close(name)
                 file.remove(name);
                 file.remove(follow);
                end
                return configfile;   
            end
        end
    end
end

return configfile;




