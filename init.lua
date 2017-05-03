

    print("Startup");
    if file.open("app.lua") == nil then
        print("app.lua deleted or renamed")
    else
        print("Running")
        file.close("app.lua")
        -- the actual application is stored in 'application.lua'
        app=dofile("app.lua");
        app.start();
    end


