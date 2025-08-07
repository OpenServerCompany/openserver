local computer = require("computer");
local io = require("io");

local devices_template = {
    CPU = {
        class = 'processor',
        description = 'CPU',
        product = 'FlexiArch 1 Processor', --'FlexiArch 2 Processor', --'FlexiArch 3 Processor'
        clock = '500'                      --1000 --1500
    },
    MEMORY = {
        class = 'volume',
        description = 'Filesystem',
        capacity = 1070000, --2147480 (--395496)
        product = 'MPFS.21.6',
        size = 1040000,
        clock = '80\80\40',
    },
    GPU = {
        class = 'display',
        product = 'MPG1000 GTZ', -- 'MPG2000' GTZ
        capacity = 800,          --2000,
        width = 1,               --4
    },
    OSU = {
        class = 'memory',
        clock = 500, --1000 --1500
    }
}

local devices = computer.getDeviceInfo();

local PROCESSOR_MULTIPLEXOR = 1.0;
local OSU_MULTIPLEXOR = 0;

for _, device in pairs(devices) do
    --for key, value in pairs(device) do
    --    print(key .. ' ' .. value);
    --    io.read();
    --end
    --print("------------------");
    --io.read()
    --
    --print(tostring(device.class) ..
    --' ' .. tostring((device.clock or 'no clock')) .. ' ' .. (type((device.clock or 'no clock'))));
    --
    --print("====================")

    if device.class == 'processor' then
        local version = string.match(device.product, '%d');
        if version ~= nil then
            PROCESSOR_MULTIPLEXOR = version / 4;
            print("P " .. PROCESSOR_MULTIPLEXOR)
        end
    end


    if device.class == "memory" and tonumber(device.clock) then
        OSU_MULTIPLEXOR = OSU_MULTIPLEXOR + tonumber(device.clock) / 3000;
        print("O " .. OSU_MULTIPLEXOR);
    end
end

function useProcessor(time)
    return time - time * PROCESSOR_MULTIPLEXOR;
end

function useOSU(time)
    return time - time * OSU_MULTIPLEXOR;
end

print(useProcessor(5) .. ' ' .. useOSU(5));
