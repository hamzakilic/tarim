configfile = {};
configfile.name="http/config.json";
configfile.follow="http/config.follow";
configfile.data = nil;

function configfile.isConfigExists()
    return file.exists(configfile.name);
end

function configfile.isFollowExists()
    return file.exists(configfile.name);
end

function configfile.removeFollowFile()
    return file.remove(configfile.follow);
end


function configfile.read() 
    if file.exists(configfile.follow) or configfile.data == nil then
        if file.exists(configfile.name) then
            if  file.open(configfile.name,'r') then
                print('reading file');
                configfile.data =cjson.decode(file.read());
                print('removing follow file');
                file.remove(configfile.follow);
            end
        end
    end
end


