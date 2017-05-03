require("webwifi");
require("webserver");
require("configfile");
require("watcher");

local app={};
function app.start()

watcher.init();
watcher.start();
webserver.init();
webwifi.start();
--buttonNow.start()
--automatic.start();
-- wifi.sta.connect() not necessary because config() uses auto-connect=true by default

end
return app;
