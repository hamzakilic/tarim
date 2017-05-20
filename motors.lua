local motors = {}

function motors:init()   
    pins = dofile('pins.lc');
    gpio.mode(D5,gpio.OUTPUT);
    gpio.write(D5,0);
    gpio.mode(D6,gpio.OUTPUT);
    gpio.write(D6,0);   
    pins = nil;
    
end


function motors:work(index,value)
    pins = dofile('pins.lc');
    local port = D5;
    if index ==2 then
     port = D6;
    end
    if value == true then
        gpio.write(port,1)
    else
        gpio.write(port,0);
    end
    pins = nil;
end
return motors;


