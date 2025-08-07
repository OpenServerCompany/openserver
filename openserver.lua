VERSION = "3.0";

local opencore = require("lib/opencore");

SWITCH = opencore.usePCPower(4);
TRANSMITING = opencore.usePCPower(6);
DOCODING = opencore.usePCPower(4);

function sleep(time)
    os.sleep(time);
end

function transmiting()
    print("Transmiting...");
    sleep(TRANSMITING);
end

function decoding()
    print("Decoding...");
    sleep(DOCODING);
end

function switch()
    print("Switching...");
    sleep(SWITCH);
end

function init()
    print("OPEN OS");
    sleep(1);
    print("Version " .. VERSION);
    sleep(3);
    print("Init...");
    sleep(3);
    print("Load core...");
    sleep(5);
    print("OPEN OS Hello");
    sleep(1);
end

init();

while true do
    local messsage_id = tostring(math.ceil(math.random(100000000, 999999999)));
    switch()
    transmiting();
    print("Receive package: ", messsage_id);
    decoding();
    local a = tostring(math.ceil(math.random(100, 999)));
    local b = tostring(math.ceil(math.random(100, 999)));
    local c = tostring(math.ceil(math.random(100, 999)));
    print("Send package: " .. a .. " " .. b .. " " .. c);
end
