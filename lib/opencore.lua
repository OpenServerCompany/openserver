-- Название модуля
local opencore = {};

local computer = require("computer")
local devices = computer.getDeviceInfo();

local PROCESSOR_MULTIPLEXOR = 1.0;
local OSU_MULTIPLEXOR = 0;

for _, device in pairs(devices) do
    if device.class == 'processor' then
        local version = string.match(device.product, '%d');
        if version ~= nil then
            PROCESSOR_MULTIPLEXOR = version / 3;
            --print("Processor can use " .. PROCESSOR_MULTIPLEXOR)
        end
    end


    if device.class == "memory" and tonumber(device.clock) then
        OSU_MULTIPLEXOR = OSU_MULTIPLEXOR + tonumber(device.clock) / 3000;
        --print("OSU can use " .. OSU_MULTIPLEXOR);
    end
end

function opencore.usePCPower(time)
    return time - time * (PROCESSOR_MULTIPLEXOR * OSU_MULTIPLEXOR * 0.9);
end

return opencore;
