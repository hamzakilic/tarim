
local clock = {}


function clock:read()

    ds3231 =dofile('ds3231.lc')
    ds3231.init(3, 4);
    second, minute, hour, day, date, month, year = ds3231.getTime();
    --prettyTime = string.format("%s,day:%s %s %s %s %s:%s:%s", days[day], day, date, months[month], year, hour, minute, second)
    --print(prettyTime);
    clock.hour = hour;
    clock.minute = minute;
    clock.second = second;
    clock.year = year;
    clock.month = month;
    clock.date = date;
    clock.day=day;
    
    ds3231 = nil;
    collectgarbage();
    
    return clock;
        
    
end

return clock;
